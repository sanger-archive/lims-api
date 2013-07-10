require 'lims-api/spec_helper'

require 'lims-api/context'
require 'lims-core/persistence/sequel'

shared_examples_for "core context" do |model_name, plural_name,  core_class|
  it "find the correct resource" do
    subject.for_model(plural_name).should be_a(Lims::Api::Resource)
  end

  it"should not find the singular name" do
    subject.for_model(model_name).should == nil
  end

  it "find the correct name" do
    subject.find_model_name(core_class).should == model_name.to_s
  end
end

class Plate
  include Lims::Core::Resource
end
module Lims::Api
  describe Context do
    let(:url_generator) { |u| u }
    subject { described_class.new(mock("Store"), mock("MessageBus"), mock("application_id"), url_generator, '') }
    it_behaves_like('core context', :plate, :plates, Plate)

    context "#model" do
      it "should not find everything" do
        subject.for_model("invalid model").should == nil
      end

      # Maybe
      it "should not find actions" do
        subject.for_model("plate_transfer").should == nil
      end
    end

    context "#mime type" do
      before(:all) do
        class Context
          module TestMime
            def test_mime
              true
            end
          end
          include TestMime
        end
      end
    subject { described_class.new(mock("Store"), mock("MessageBus"), mock("application_id"), url_generator, 'test;test_mime=true') }

      it "should include mime type specific module" do
        subject.respond_to?(:test_mime).should == true
        subject.test_mime.should == true
      end

    end

    context "#uuid" do
      context "with an valid uuid" do
        # Here we mock the session load of the UuidResource
        # this test might seems useless and linked to the implementation
        # of for_uuid. What we do is check that this call load the resource
        # and create an appriate resource.

        before {
          Lims::Core::Persistence::Session.any_instance.tap do |session|
            session.stub_chain("uuid_resource.[]") { uuid_resource }
          end
        }
        let(:store) {
          Lims::Core::Persistence::Store.new
        }
        let(:message_bus) { mock(:message_bus).tap { |m| m.stub(:publish) { mock(:publish) }} }
        let(:application_id) { mock(:application_id) }
        subject { described_class.new(store, message_bus, application_id, url_generator, '') }
        let(:uuid) { "hello, my name is UUID"}
        let(:uuid_resource) { Lims::Core::Persistence::UuidResource.new(:uuid => uuid, :model_class => Plate) }

        it "should return a valid resource" do
          resource = subject.for_uuid(uuid)
          resource.should be_a(CoreResource)
          resource.uuid.should == uuid
          resource.model_name == "plate"
        end
      end
    end

    context "#for_root" do
      subject { described_class.new(mock(:store), mock(:message_bus), mock(:application_id), url_generator, '').for_root }
      it "is a resource" do
        subject.should be_a(Resource)
      end

      it "has all resources in resource map" do
        subject.resource_map.keys.should include(*%w{plates})
        subject.resource_map.values.each do |resource|
          resource.should be_a(Resource)
        end
      end
    end
  end
end
