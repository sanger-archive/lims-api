#require 'spec_helper'

require 'lims-api/core_class_resource'

module Lims::Api
  describe CoreClassResource do
    let(:model_class) {
      class Model
      end
    }
    let(:resource) { described_class.new(model_class, "model" ) }
    context "::JSonEncoder" do
      subject { resource.encoder_for(['application/json'], lambda { |url| "/#{url}"  })}
      it "return a list of actions" do
        JSON.parse(subject.call).should == {
          "model" => {
            "actions" => {
              "create" => "/model/create"
            }
          }
        }

      end
    end
  end
end
