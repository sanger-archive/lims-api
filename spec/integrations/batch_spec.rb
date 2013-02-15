require 'spec_helper'
require 'integrations/lab_resource_shared'
require 'integrations/spec_helper'

module Lims::Core

  shared_context "batch json" do
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
          "process" => process 
        }
      }
    }
  end

  describe Organization::Order do
    include_context "use core context service", :batches
    include_context "JSON"

    context "#create" do
      context "with correct parameters" do
        include_context "use generated uuid"
        include_context "batch json"
        let(:url) { "/batches" }
        let(:process) { "manual extraction" }
        let(:parameters) { {:batch => {:process => process}} }
        it_behaves_like "a valid core action"
      end
    end
  end
end
