#tube_spec.rb
require 'spec_helper'

require 'lims-api/context_service'
require 'lims-api/resource_shared'
require 'lims-core'
require 'lims-core/persistence/sequel'

require 'lims-api/resource_shared'
require 'integrations/lab_resource_shared'
require 'integrations/tube_resource_shared'
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

shared_context "with saved tube" do
  let!(:uuid) {
    "11111111-2222-3333-4444-555555555555".tap do |uuid|
      store.with_session do |session|
        tube = Lims::Core::Laboratory::Tube.new
        tube << Lims::Core::Laboratory::Aliquot.new(:sample => session[sample_uuid])
        set_uuid(session, tube, uuid)
      end
    end
  }
end

describe Lims::Core::Laboratory::Tube do
  include_context "use core context service", :tube_aliquots, :aliquots, :tubes, :samples, :labels, :labellables
  include_context "JSON"
  let(:asset) { "tube" }
  let(:model) { "#{asset}s" }

  context "#create" do
    context do
      include_context "for empty tube-like asset"
      include_context "expect tube JSON"
      it_behaves_like('creating a resource') 
    end
    context do
      include_context "for tube-like asset with samples"
      include_context "expect tube JSON"
      include_context "with filled aliquots"
      it_behaves_like('creating a resource')
    end
    context do
      include_context "for tube-like asset with samples and labels"
      include_context "resource with labels for the expected JSON"
      include_context "with labels"
      include_context "expect tube JSON with labels"
      include_context "with filled aliquots"
      it_behaves_like('creating a resource with a label on it')
    end
  end

  context "#update" do
    include_context "for tube-like asset with samples"
    include_context "with saved tube"
    include_context "expect tube JSON"
    include_context "with filled aliquots"

    let(:path) { "/#{uuid}" }
    let(:aliquot_type) { "DNA" }
    let(:aliquot_quantity) { 5 }
    let(:parameters) { {:aliquot_type => aliquot_type, 
                        :aliquot_quantity => aliquot_quantity} }

    it_behaves_like "updating a resource" 
  end
end
