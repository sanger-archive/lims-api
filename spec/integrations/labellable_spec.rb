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
    end
  end
end
