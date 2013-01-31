require 'spec_helper'

require 'lims-api/context_service'
require 'lims-core'
require 'lims-core/persistence/sequel'

require 'integrations/spec_helper'
require 'integrations/lab_resource_shared'

module Lims::Core

  shared_context "expect labellables without labels" do
    let(:labels_hash) { {} }
  end

  shared_context "for labellables without labels" do
    let(:parameters) { { :labellable => required_parameters } }
    include_context "expect labellables without labels"
  end

  shared_context "expect labellables with label(s)" do
    let(:front_barcode_label_position) { "front barcode" }
    let(:front_barcode_label_value) { "1234-ABC" }
    let(:front_barcode_label_type) { "sanger-barcode" }
    let(:front_barcode_label_hash) {
      { front_barcode_label_position => { "value" => front_barcode_label_value,
                                          "type" => front_barcode_label_type }
      }
    }
    let(:labels_hash) { front_barcode_label_hash }
  end

  shared_context "for labellables with labels" do
    let(:label_hash_for_request) { { :labels => front_barcode_label_hash } }
    let(:parameters) { { :labellable => required_parameters.merge(label_hash_for_request) } }
    include_context "expect labellables with label(s)"
  end

  describe Laboratory::Labellable do
    include_context "use core context service", :labels, :labellables 
    include_context "JSON"
    let(:model) { "labellables" }
    
    context "#create" do

      context "with empty parameters" do
        let(:url) { "/actions/create_labellable" }
        let(:parameters) { {} }
        let(:expected_json) { {"errors"=> 
          { "name"=>"invalid", "type"=>"invalid"} 
        } }
        it_behaves_like "an invalid core action", 422
      end

      include_context "setup required parameters for labellable"

      context do
        include_context "for labellables without labels"
        include_context "expected labellables JSON"
        it_behaves_like "creating a resource"
      end

      context do
        include_context "for labellables with labels"
        include_context "expected labellables JSON"
        it_behaves_like "creating a resource"
      end
    end
  end
end
