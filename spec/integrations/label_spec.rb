require 'spec_helper'

require 'lims-api/context_service'
require 'lims-core'
require 'lims-core/persistence/sequel'

require 'integrations/spec_helper'
require 'integrations/lab_resource_shared'

module Lims::Core

  shared_context "for labellables with label(s)" do
    # define variables for the expected JSON
    let(:front_barcode_label_position) { "front barcode" }
    let(:front_barcode_label_value) { "1234-ABC" }
    let(:front_barcode_label_type) { "sanger-barcode" }
    let(:front_barcode_label_hash) { 
      { front_barcode_label_position => { "value" => front_barcode_label_value,
                                          "type" => front_barcode_label_type }
      }
    }
    let(:labels_hash) { front_barcode_label_hash }

    # create a labellable object to use it later for updating it
    let!(:name) { '11111111-2222-3333-1111-000000000000' } # uuid of an asset (e.g.: plate)
    let!(:asset_type) { 'resource'}
    let!(:labellable) {
      labellable = Lims::Core::Laboratory::Labellable.new(:name => name,
                                                           :type => asset_type)
    }
    let!(:labellable_uuid) {
      # uuid is the generated uuid from "use generated uuid" shared context
      # we should use the same uuid here, to match the expected JSON
      uuid.tap do |labellable_uuid|
        store.with_session do |session|
          session << labellable
          ur = session.new_uuid_resource_for(labellable)
          ur.send(:uuid=, labellable_uuid)
        end
      end
    }
    let(:required_parameters_for_label) { { :labellable_uuid => labellable_uuid,
                                  :type => front_barcode_label_type,
                                  :value => front_barcode_label_value,
                                  :position => front_barcode_label_position} }

    let(:create_label_parameters) { { "create_label" =>  required_parameters_for_label } }
  end

  shared_examples_for "creating a label" do
    include_context "use generated uuid"
    it "creates a new label" do
      response = post(create_label_url, create_label_parameters.to_json)
      response.status.should == 200
      get("/#{labellable_uuid}").body.should match_json(expected_json)
    end
  end

  describe Laboratory::Labellable::Label do
    include_context "use core context service"
    include_context "JSON"
    let(:create_label_url) { "/actions/create_label" }
    let(:model) { "labellables" }
    
    context "#create" do
      context "with empty parameters" do
        let(:parameters) { {} }
        let(:expected_json) { {"errors"=> 
          { "labellable"=>"invalid", "type"=>"invalid", "value"=>"invalid", "position"=>"invalid"}
        } }
        let!(:url) { create_label_url }
        it_behaves_like "an invalid core action", 422
      end
      context do
        include_context "for labellables with label(s)"
        include_context "expected labellables JSON"
        it_behaves_like "creating a label"
      end
    end
  end
end
