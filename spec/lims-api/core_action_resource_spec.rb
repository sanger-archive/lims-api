require 'spec_helper'
require 'lims-api/resource_shared'

require 'lims-api/core_action_resource'
module Lims
  class SumAction
    include Core::Actions::Action
    attribute :x, Fixnum
    attribute :y, Fixnum
    attribute :z, Fixnum
    def _call_in_session(session)
      @z=x+y
    end
  end
  module Api

    describe CoreActionResource do
      context "with a valid context" do

        let(:store) { mock(:store).tap do |store| 
          store.stub(:with_session).and_yield(mock(:session))
        end }
        let(:server_context) {
          Context.new(store, lambda { |u| "/#{u}" })
        }


        let(:resource) { described_class.new(server_context, SumAction, "test_action") }
        context "#creates" do
          let(:x) {  1 }
          let(:y) {  2 }
          let(:expected_result) { 3 }
          let(:parameters) {  { :x => x, :y => y} } 
          subject { resource.creator(parameters).call }
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
            subject { resource.creator(parameters).call.encoder_for(['application/json']) }

            it "displays the correct JSON" do
              subject.call.should match_json({"test_action" => parameters.merge({:actions => {},
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
