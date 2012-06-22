#require 'spec_helper'

require 'lims-api/core_resource'

module Lims::Api
  describe CoreResource do
    let(:uuid) { "00000000-1234-0001-0000-000000000000" }
    let(:model) { mock("Model").tap do |m|
      m.stub(:attributes).and_return({:name => "A", :x => 10}) 
      m.stub(:uuid).and_return(uuid)
      m.class.stub(:name).and_return("model")
    end }
    let(:resource) { described_class.new(model) }
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
end
