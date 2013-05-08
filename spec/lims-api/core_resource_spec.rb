#require 'spec_helper'
require 'lims-api/resource_shared'

require 'lims-api/core_resource'

shared_examples_for "encodable resource" do
  context "::JSonEncoder" do
    subject { resource.encoder_for(['application/json'])}
    it "return a list of actions" do
      JSON.parse(subject.call).should == {
        "model" => {
          "actions" => {
            "read" => "/#{uuid}",
            "create" => "/#{uuid}",
            "update" => "/#{uuid}",
            "delete" => "/#{uuid}"
          },
        "uuid" => uuid,
        "name" => "A",
        "x" => 10
        }
      }
    end
  end
end

shared_examples_for "readable" do
  it do
    resource.reader.call.should == resource
  end
end

shared_examples_for "updatable" do
  let(:attributes) { {:name => "B" } }
  let(:model_class) { model.class }
  it do
    server_context.stub(:find_model_class) { |a| model_class }

    # we are just testing that the object receives the correct call
    # We are not checking that the object is really updated
    # as it would be hard to do for a mock object.
    model.should_receive(:update).with(attributes)
    resource.updater(attributes).call.should == resource
  end
end

shared_examples_for "deletable" do
  let(:model_class) { model.class }
  it do
    server_context.stub(:find_model_class) { |a| model_class }

    # This test is not really testing anything as the Session is mocked ...
    # We are justing here that the action exists and do its job
    # not the underlying implementation will effectively delete the object
    session.should_receive(:delete_resource).with(uuid_resource).and_return(model)
    resource.deleter.call.should == resource
  end
end

shared_examples_for "creatable" do
  let(:attributes) { {:name => "B" } }
  let(:child) { mock(:child) } 
  it do
    model.should_receive(:create).with(attributes).and_return(child)
    resource.creator(attributes ).call.should == child
  end
end

module Lims::Api
  describe CoreResource do
    let(:store) { Lims::Core::Persistence::Store.new }
    include_context 'mock context'
    let(:uuid) { "00000000-1234-0001-0000-000000000000" }
    let(:uuid_resource) { Lims::Core::Persistence::UuidResource.new(:uuid => uuid, :model_class => String) }
    let(:model) { mock("Model").tap do |m|
      m.stub(:attributes).and_return({:name => "A", :x => 10}) 
    end }

    context "initialized with an object" do
      let(:resource) { described_class.new(server_context, uuid_resource, "model", model) }
      it_behaves_like "encodable resource" 
    end

    context "initialized without an object" do
      let(:resource) { described_class.new(server_context, uuid_resource, "model") }
      subject { resource }
      context "without preloading of object" do
        it "must raise an error when accessing the object" do
          expect {
            subject.object
          }.to raise_error
        end
      end
      context "after preloading of object" do
        let!(:session) {
          mock("Session").tap do |session|
          server_context.stub("with_session").and_yield(session)
          session.should_receive(:[]).with(uuid_resource) { model }
          resource.object(session)
          end
        }
        its(:object) { should == model }
        it_behaves_like "encodable resource" 
        it_behaves_like "readable" 
        it_behaves_like "updatable" 
        it_behaves_like "creatable" 
        it_behaves_like "deletable" 
      end
    end

  end
end
