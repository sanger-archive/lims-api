require 'spec_helper'

require 'lims-api/mime_type'

shared_examples_for "parse string" do |string, type, expected_parameters={}|
  context "parse initial string" do
    subject { described_class.new(string) }
    it "has the correct type" do
      subject.type.should == type
    end
    expected_parameters.each do |key, value|
      it "'s parameter #{key} should be set" do
        subject[key].should == value
      end
    end
  end
end
module Lims::Api
  describe MimeType do
    it_behaves_like("parse string", "application/json", 'application/json')
    it_behaves_like("parse string", "application/json; a=1; b=text", 'application/json', {"a" => "1", "b" => 'text'})
  end
end

