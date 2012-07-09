#require 'spec_helper'

require 'lims-api/core_resource'

shared_examples_for "encodable resource" do
  context "::JSonEncoder" do
    subject { resource.encoder_for(['application/json'], lambda { |url| "/#{url}"  })}
    it "return a list of actions" do
      JSON.parse(subject.call).should == {
        "model" => {
        "actions" => {
        "read" => "/#{uuid}",
        "create" => "/#{uuid}",
        "update" => "/#{uuid}",
        "delete" => "/#{uuid}"
      }
      },
        "name" => "A",
        "x" => 10
      }
    end
  end
end

shared_examples_for "readable" do
  it do
    resource.reader(context).call.should == model
  end
end

shared_examples_for "updatable" do
  let(:attributes) { {:name => "B" } }
  it do
    model.should_receive(:update).with(attributes)
    resource.updater(context, attributes ).call.should == model
  end
end

module Lims::Api
  describe CoreResource do
    let(:uuid) { "00000000-1234-0001-0000-000000000000" }
    let(:uuid_resource) { Lims::Core::Uuids::UuidResource.new(:uuid => uuid, :model_class => String) }
    let(:model) { mock("Model").tap do |m|
      m.stub(:attributes).and_return({:name => "A", :x => 10}) 
    end }
    context "initialized with an object" do
      let(:resource) { described_class.new(uuid_resource, "model", model) }
      it_behaves_like "encodable resource" 
    end

    context "initialized without an object" do
      let(:resource) { described_class.new(uuid_resource, "model") }
      subject { resource }
      context "without preloading of object" do
        it "must raise an error when accessing the object" do
          expect {
            subject.object
          }.to raise_error
        end
      end
      context "after preloading of object" do
        let(:session) {
          mock("Session").tap do |session|
            session.should_receive(:object_for).with(uuid_resource) { model }
            resource.object(session)
          end
        }
        let!(:context) {
          mock(:context).tap do |context|
          context.stub_chain("store.with_session").and_yield(session)

          # we can't use subject here as it will be changed by the shared
          # example

          end
        }
        its(:object) { should == model }
        it_behaves_like "encodable resource" 
        it_behaves_like "readable" 
        it_behaves_like "updatable" 
      end
    end

  end
end
