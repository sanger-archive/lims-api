#tube_spec.rb
require 'spec_helper'

require 'lims-api/context_service'
require 'lims-core'
require 'lims-core/persistence/sequel'

require 'integrations/lab_resource_shared'
require 'integrations/spec_helper'

shared_context "expect tube JSON" do
  let (:expected_json) {
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

shared_context "for empty tube" do
  let (:aliquot_array) { [] }
  let (:parameters) { { } }
end

shared_context "for tube with samples" do
  let (:sample) { Lims::Core::Laboratory::Sample.new("sample 1") }
  include_context "with saved sample"
  let (:aliquot_array) { [ { "sample_uuid"=> sample_uuid } ]  } 
  let (:aliquots) {{:aliquots => aliquot_array }}
  let (:parameters) { aliquots }
end


describe Lims::Core::Laboratory::Tube do
  include_context "use core context service", :tubes, :samples
  include_context "JSON"
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
      it_behaves_like('creating a resource')
    end
  end
end

