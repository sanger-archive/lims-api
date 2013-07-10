require 'spec_helper'

require 'lims-api/core_action_resource'
module Lims
  class SumAction
    include Core::Actions::Action
    NOT_IN_ROOT = true
    attribute :x, Fixnum
    attribute :y, Fixnum
    attribute :z, Fixnum
    def _call_in_session(session)
      @z=x+y
    end
  end

  module Api

    describe Lims::Api::CoreActionResource do
      context "with a valid context" do

        let(:store) { mock(:store).tap do |store| 
          store.stub(:with_session).and_yield(mock(:session))
        end }
        let(:message_bus) { mock(:message_bus) }
        let(:application_id) { mock(:application_id) }
        let(:server_context) {
          Context.new(store, message_bus, application_id, lambda { |u| "/#{u}" }, '').tap do |context|
            context.stub(:resource_class_for_class) { Lims::Api::CoreActionResource }
            context.stub(:publish) { mock(:publish) }
          end
        }


        let(:resource) { described_class.new(server_context, SumAction, :test_action) }
        context "#creates" do
          let(:x) {  1 }
          let(:y) {  2 }
          let(:expected_result) { 3 }
          let(:parameters) {  { :x => x, :y => y} } 
          subject { resource.creator({:test_action => parameters}).call }
          it {should be_a(CoreActionResource) }
          its(:action) { should be_a(SumAction) }
          it "has its attributes set from the parameters" do
            subject.action.x.should == x
            subject.action.y.should == y
          end

          it  do
            subject.action.result.should == expected_result
          end


        context "with an underlying action" do
        #  add the action to it
          context "::JSON encoder" do
            subject { resource.creator({:test_action => parameters}).call.encoder_for(['application/json']) }

            it "displays the correct JSON" do
              subject.call.should match_json({:test_action => parameters.merge({:actions => {},
                                                                                :result => expected_result,
                                                                                :user => "user",
                                                                                :application => "application",
                                                                                :z => expected_result })
              })
            end

          end
        end
        end
      end
    end
  end
end
