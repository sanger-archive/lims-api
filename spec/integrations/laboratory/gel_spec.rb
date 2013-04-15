require 'spec_helper'

require 'lims-api/context_service'
require 'lims-core'
require 'lims-core/persistence/sequel'

require 'integrations/laboratory/lab_resource_shared'
require 'lims-api/resource_shared'
require 'integrations/spec_helper'

shared_context "expect empty gel" do
  let(:window_hash) { create_element_hash }
end

shared_context "expect gel JSON" do
  let(:expected_json) {
    path = "http://example.org/#{uuid}"
    { "gel" => {"actions" => {"read" => path,
                              "update" => path,
                              "delete" => path,
                              "create" => path},
                "uuid" => uuid,
                "number_of_rows" => number_of_rows,
                "number_of_columns" => number_of_columns,
                "windows" => window_hash}
    }
  }
end

shared_context "expect gel JSON with labels" do
  let(:expected_json) {
    path = "http://example.org/#{uuid}"
    { "gel" => {"actions" => {"read" => path,
                              "update" => path,
                              "delete" => path,
                              "create" => path},
                "uuid" => uuid,
                "number_of_rows" => number_of_rows,
                "number_of_columns" => number_of_columns,
                "windows" => window_hash,
                "labels" => actions_hash.merge(labellable_uuid_hash).merge(labels_hash)}
    }
  }
end

shared_context "for empty gel" do
  let(:parameters) { { :gel => dimensions } }
  include_context "expect empty gel"
end

shared_context "for gel with samples" do
  let(:parameters) { { :gel => dimensions.merge(:windows_description => windows_description) } }
  include_context "with saved sample"
  include_context "with filled aliquots"
  let(:aliquot_type) { 'sample' }
  let(:aliquot_quantity) { 10 }
  let(:unit_type) { "mole" }
  let(:windows_description) { { "C5" => [{"sample" => sample_uuid, "quantity" => aliquot_quantity, "type" => aliquot_type }] } }
  let(:windows_description_response) { { "C5" => aliquot_array } }
  let(:window_hash) { create_element_hash.merge(windows_description_response) }
end

shared_context "for gel with samples and labels" do
  include_context "for gel with samples"

  let(:label_parameters) {
    { :labellables => labellable }
  }
end

describe Lims::Core::Laboratory::Gel do
  include_context "use core context service"
  include_context "JSON"
  include_context "use generated uuid"
  let(:model) { "gels" }

  context "#create" do
    include_context "has standard dimensions"
    context "with empty gels" do
      include_context "for empty gel"
      include_context "expect gel JSON"
      it_behaves_like('creating a resource')
    end
    context "with gels with samples" do
      include_context "for gel with samples"
      include_context "expect gel JSON"
      it_behaves_like('creating a resource')
    end
    context "with gels with samples and labels" do
      include_context "for gel with samples and labels"
      include_context "resource with labels for the expected JSON"
      include_context "with labels"
      include_context "expect gel JSON with labels"
      it_behaves_like('creating a resource with a label on it')
    end
  end
end
