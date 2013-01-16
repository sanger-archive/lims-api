require 'spec_helper'

require 'lims-api/context_service'
require 'lims-core'
require 'lims-core/persistence/sequel'

require 'integrations/spec_helper'
require 'integrations/lab_resource_shared'

module Lims::Core

  shared_context "expected labellables JSON" do
    let(:expected_json) {
      path = "http://example.org/#{uuid}"
      { "labellable" => { "actions" => {"read" => path,
                                        "update" => path,
                                        "delete" => path,
                                        "create" => path},
                          "uuid" => uuid,
                          "name" => name,
                          "type" => asset_type,
                          "labels" => labels_hash
                        }
      }
    }
  end

  shared_context "create a labellable" do
    let!(:labellable) {
      store.with_session do |session|
        session << labellable=Laboratory::Labellable.new(:name => name, :type => :asset_type)
        labellable
      end
    }
  end

  shared_context "for labellables with label(s)" do
    let(:url) { "/actions/create_label" }
    # define the response JSON
    let(:front_barcode_label_position) { "front barcode" }
    let(:front_barcode_label_value) { "1234-ABC" }
    let(:front_barcode_label_type) { "sanger-barcode" }
    let(:front_barcode_label_hash) { 
      { front_barcode_label_position => { "value" => front_barcode_label_value,
                                          "type" => front_barcode_label_type }
      }
    }
    let(:labels_hash) { front_barcode_label_hash }
    
    # define the laballables to test
    let(:labels_hash_for_request) { { 
      front_barcode_label_position => { :value => front_barcode_label_value,
                                        :type => front_barcode_label_type} }
    }
    let(:parameters) { { :labellable => required_parameters.merge("labels" => labels_hash_for_request) } }
  end

  shared_context "setup required parameters" do
    let(:name) { '11111111-2222-3333-1111-000000000000' } # uuid of an asset (e.g.: plate)
    let(:asset_type) { 'resource'} # type of the asset the labellables belongs to
    let(:required_parameters) { { :name => name, :type => asset_type} }
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

      include_context "setup required parameters"

      context do
        include_context "for labellables with label(s)"
        include_context "expected labellables JSON"
        it_behaves_like "creating a resource"
      end
    end
  end
end
