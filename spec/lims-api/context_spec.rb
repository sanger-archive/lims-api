#require 'spec_helper'

require 'lims-api/context'

shared_context "core context" do |model_name, plural_name,  core_class|
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

module Lims::Api
  describe Context do
    subject { described_class.new(mock("Store")) }
    it_behaves_like('core context', :plate, :plates, Lims::Core::Laboratory::Plate)
    it_behaves_like('core context', :study, :studies, Lims::Core::Organization::Study)

    context "#model" do
      it "should not find everything" do
        subject.for_model("invalid model").should == nil
      end

      # Maybe
      it "should not find actions" do
        subject.for_model("plate_transfer").should == nil
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
        subject { described_class.new(store) }
        let(:uuid) { "hello, my name is UUID"}
        let(:uuid_resource) { Lims::Core::Uuids::UuidResource.new(:uuid => uuid, :model_class => Lims::Core::Laboratory::Plate) }

        it "should return a valid resource" do
          resource = subject.for_uuid(uuid)
          resource.should be_a(CoreResource)
          resource.uuid.should == uuid
          resource.model_name == "plate"
        end
      end
    end
  end
end
