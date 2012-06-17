#require 'spec_helper'

require 'lims-api/context'

shared_context "core context" do |model_name, core_class|
  it "find the correct resource" do
    subject.for_model(model_name).should be_a(Lims::Api::Resource)
  end
end

module Lims::Api
  describe Context do
    subject { described_class.new(mock("Store")) }
    it_behaves_like('core context', :plate, Lims::Core::Laboratory::Plate)
    it_behaves_like('core context', :study, Lims::Core::Organization::Study)

    it "should not find everything" do
      subject.for_model("invalid model").should == nil
    end

    # Maybe
    it "should not find action" do
      subject.for_model("plate_transfer").should == nil
    end
  end
end
