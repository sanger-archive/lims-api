#tube_spec.rb
require 'spec_helper'

require 'lims-api/context_service'
require 'lims-api/resource_shared'
require 'lims-core'
require 'lims-core/persistence/sequel'

require 'lims-api/resource_shared'
require 'integrations/lab_resource_shared'
require 'integrations/spec_helper'

shared_context "expect tube JSON" do
  let(:expected_json) {
    path = "http://example.org/#{uuid}"
    { "tube" => {"actions" => {"read" => path,
          "update" => path,
          "delete" => path,
          "create" => path},
        "uuid" => uuid,
        "aliquots" => aliquot_array}
    }
  }
end

shared_context "expect tube JSON with labels" do
  let(:expected_json) {
    path = "http://example.org/#{uuid}"
    { "tube" => {"actions" => {"read" => path,
          "update" => path,
          "delete" => path,
          "create" => path},
        "uuid" => uuid,
        "aliquots" => aliquot_array,
        "labels" => actions_hash.merge(labellable_uuid_hash).merge(labels_hash)}
    }
  }
end

shared_context "for empty tube" do
  let (:aliquot_array) { [] }
  let (:viewed_aliquot_array) { aliquot_array }
  let (:parameters) { { :tube => { } }}
end

shared_context "for tube with samples" do
  let (:sample) { Lims::Core::Laboratory::Sample.new("sample 1") }
  include_context "with saved sample"
  let (:aliquot_type) { "sample" }
  let (:aliquots) {{:aliquots => [ { "sample_uuid" => sample_uuid, :type => aliquot_type } ] }}
  let (:parameters) { { :tube => aliquots} }
end

shared_context "for tube with samples and labels" do
  include_context "for tube with samples"

  let(:label_parameters) {
    { :labellables => labellable }
  }
end

describe Lims::Core::Laboratory::Tube do
  include_context "use core context service", :tubes, :samples, :labels, :labellables
  include_context "JSON"
  include_context "use generated uuid"
  let(:model) { "tubes" }

  context "#create" do
    context do
      include_context "for empty tube"
      include_context "expect tube JSON"
      it_behaves_like('creating a resource') 
    end
    context do
      include_context "for tube with samples"
      include_context "expect tube JSON"
      include_context "with filled aliquots"
      it_behaves_like('creating a resource')
    end

    context do
      include_context "for tube with samples and labels"
      include_context "resource with labels for the expected JSON"
      include_context "with labels"
      include_context "expect tube JSON with labels"
      include_context "with filled aliquots"
      it_behaves_like('creating a resource with a label on it')
    end
  end
end

