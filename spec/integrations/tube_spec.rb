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
        "type" => tube_type,
        "max_volume" => tube_max_volume,
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
        "type" => tube_type,
        "max_volume" => tube_max_volume,
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
  include_context "use generated uuid"
  let(:model) { "tubes" }

  context "#create" do
    context do
      let(:tube_type) { nil }
      let(:tube_max_volume) { nil }    
      include_context "for empty tube-like asset"
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

  context "#update" do
    include_context "for tube with samples"
    include_context "with saved tube"
    include_context "expect tube JSON"
    include_context "with filled aliquots"

    let(:path) { "/#{uuid}" }
    let(:aliquot_type) { "DNA" }
    let(:aliquot_quantity) { 5 }
    let(:parameters) { {:type => tube_type,
                        :max_volume => tube_max_volume,
                        :aliquot_type => aliquot_type, 
                        :aliquot_quantity => aliquot_quantity} }

    it_behaves_like "updating a resource" 
  end

  context "#transfer tubes to tubes" do
    let(:url) { "/actions/transfer_tubes_to_tubes" }

    context "with empty tubes" do
      let(:parameters) { { :transfer_tubes_to_tubes => {} } }
      let(:expected_json) { {"errors" => {:transfers => "invalid" }
      }}
      it_behaves_like "an invalid core action", 422  # Unprocessable entity
    end

    context "from a tube with samples" do
      context "to an existing target tube" do
        let(:aliquot_array_source) {
          path = "http://example.org/#{sample_uuid}"
            [
              { "sample"=> {"actions" => { "read" => path,
                "create" => path,
                "update" => path,
                "delete" => path },
              "uuid" => sample_uuid,
              "name" => sample_name},
              "quantity" => 0,
              "type" => aliquot_type,
              "unit" => unit_type
              },
              solvent
            ]
        }
        let(:aliquot_array_target) {
          path = "http://example.org/#{sample_uuid}"
            [
              { "sample"=> {"actions" => { "read" => path,
                "create" => path,
                "update" => path,
                "delete" => path },
              "uuid" => sample_uuid,
              "name" => sample_name},
              "quantity" => 100,
              "type" => "RNA",
              "unit" => unit_type
              },
              modified_solvent
            ]
        }
        let(:solvent) { {"quantity" => 0, "type" => "solvent", "unit" => "ul"} }
        let(:modified_solvent) { {"quantity"=>100, "type"=>"solvent", "unit"=>"ul"} }

        let(:unit_type) { "mole" }
        let(:aliquot_type) { "NA" }
        let!(:quantity) { 100 }
        let(:volume) { 100 }
        let(:source_tube1_uuid) { '22222222-3333-4444-1111-000000000000'.tap do |uuid|
          store.with_session do |session|
            quantity = 100
            tube = Lims::Core::Laboratory::Tube.new
            L=Lims::Core::Laboratory
            sample = L::Sample.new(:name => "sample 1")
            aliquot = L::Aliquot.new(:sample => sample, :quantity => 100, :type => aliquot_type)
            tube << aliquot
            tube << L::Aliquot.new(:type => L::Aliquot::Solvent, :quantity => volume)

            session << tube
            set_uuid(session, tube, uuid)
          end
        end

        }
        let(:target_tube2_uuid) { '22222222-3333-4444-1111-000000000001'.tap do |uuid|
            store.with_session do |session|
              tube = Lims::Core::Laboratory::Tube.new

              session << tube
              set_uuid(session, tube, uuid)
            end
          end
        }
        let(:transfers) { [ { "source_uuid" => source_tube1_uuid,
                              "target_uuid" => target_tube2_uuid,
                              "amount" => 100,
                              "aliquot_type" => "RNA"}
          ]
        }
        let(:parameters) { { :transfer_tubes_to_tubes => { :transfers => transfers} }}
        let(:sample_uuid) { '11111111-2222-3333-4444-555555555555' }
        let(:sample_name) { "sample 1" }

        let(:expected_json) {
          source_tube1_url = "http://example.org/#{source_tube1_uuid}"
          target_tube2_url = "http://example.org/#{target_tube2_uuid}"
          { :transfer_tubes_to_tubes =>
            { :actions => {},
              :user => "user",
              :application => "application",
              :result => {
                :sources => [
                  {"tube" => {
                      "actions" => {
                        "read" => source_tube1_url,
                        "create" => source_tube1_url,
                        "update" => source_tube1_url,
                        "delete" => source_tube1_url
                      },
                      "uuid" => source_tube1_uuid,
                      "type" => nil,
                      "max_volume" => nil,
                      "aliquots" => aliquot_array_source
                    }}
                ],
                :targets => [
                  {"tube" => {
                      "actions" => {
                        "read" => target_tube2_url,
                        "create" => target_tube2_url,
                        "update" => target_tube2_url,
                        "delete" => target_tube2_url
                      },
                      "uuid" => target_tube2_uuid,
                      "type" => nil,
                      "max_volume" => nil,
                      "aliquots" => aliquot_array_target
                    }}
                ]
              },
              :transfers => transfers
            }
          }
        }

        it_behaves_like "a valid core action"
      end
    end
  end
end
