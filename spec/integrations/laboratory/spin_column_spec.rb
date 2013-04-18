#spin_column_spec.rb
require 'integrations/laboratory/spec_helper'

require 'lims-api/context_service'
require 'lims-api/resource_shared'
require 'lims-core/persistence/sequel'

require 'integrations/laboratory/lab_resource_shared'
require 'integrations/laboratory/tube_resource_shared'

shared_context "expect spin column JSON" do
  let(:expected_json) {
    path = "http://example.org/#{uuid}"
    { "spin_column" => {"actions" => {"read" => path,
                                      "update" => path,
                                      "delete" => path,
                                      "create" => path},
                        "uuid" => uuid,
                        "aliquots" => aliquot_array}
    }
  }
end

shared_context "expect spin column JSON with labels" do
  let(:expected_json) {
    path = "http://example.org/#{uuid}"
    { "spin_column" => {"actions" => {"read" => path,
                                      "update" => path,
                                      "delete" => path,
                                      "create" => path},
                        "uuid" => uuid,
                        "aliquots" => aliquot_array,
                        "labels" => actions_hash.merge(labellable_uuid_hash).merge(labels_hash)}
    }
  }
end

describe Lims::Core::Laboratory::SpinColumn do
  include_context "use core context service"
  include_context "JSON"
  include_context "use generated uuid"
  let(:asset) { "spin_column" }
  let(:model) { "spin_columns" }

  context "#create" do
    context do
      include_context "for empty tube-like asset"
      include_context "expect spin column JSON"
      it_behaves_like('creating a resource') 
    end
    context do
      include_context "for tube-like asset with samples"
      include_context "expect spin column JSON"
      include_context "with filled aliquots"
      it_behaves_like('creating a resource')
    end

    context do
      include_context "for spin column with samples and labels"
      include_context "resource with labels for the expected JSON"
      include_context "with labels"
      include_context "expect spin column JSON with labels"
      include_context "with filled aliquots"
      it_behaves_like('creating a resource with a label on it')
    end
  end
end
