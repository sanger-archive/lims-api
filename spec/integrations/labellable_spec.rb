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

  shared_context "expect labellables without labels" do
    let(:labels_hash) { {} }
  end

  shared_context "for labellables without labels" do
    let(:parameters) { { :labellable => required_parameters } }
    include_context "expect labellables without labels"
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
        include_context "for labellables without labels"
        include_context "expected labellables JSON"
        it_behaves_like "creating a resource"
      end
    end
  end
end
