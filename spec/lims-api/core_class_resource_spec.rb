require 'lims-api/spec_helper'
require 'lims-api/resource_shared'

require 'lims-api/core_class_resource'

module Lims::Api
  describe CoreClassResource do
    include_context 'mock context'
    let(:model_class) {
      class Model
      end
    }
    let(:resource) { described_class.new(server_context, model_class, "model" ) }
    context "::JSonEncoder" do
      subject { resource.encoder_for(['application/json']) }
      it "return a list of actions" do
        JSON.parse(subject.call).should == {
          "model" => {
            "actions" => {
              "read" => "/model",
              "create" => "/model",
              "first" => "/model/page=1",
              "last" => "/model/page=-1",
            }
          }
        }

      end
    end
  end
end
