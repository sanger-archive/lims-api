require 'spec_helper'
require 'integrations/lab_resource_shared'
require 'integrations/spec_helper'

module Lims::Core
  describe Organization::Order do
    include_context "use core context service"
    include_context "JSON"

    context "#create" do
      context "with correct parameters" do
        include_context "use generated uuid"
        let(:url) { "/batches" }
        let(:process) { "manual extraction" }
        let(:expected_json) {
          url = "http://example.org/#{uuid}"
          {
            "batch" => {
              "actions" => {
                "read" => url,
                "create" => url,
                "update" => url,
                "delete" => url
              },
              "uuid" => uuid,
              "process" => process,
              "kit" => nil
            }
          }
        }
        let(:parameters) { {:batch => {:process => process}} }
        it_behaves_like "a valid core action"
      end
    end
  end
end
