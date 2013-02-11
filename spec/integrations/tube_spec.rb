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

  context "#transfer tubes to tubes", :focus  => true do
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
              "update" => path,
              "delete" => path,
              "create" => path },
              "uuid" => sample_uuid,
              "name" => sample_name},
              "quantity" => quantity,
              "type" => aliquot_type,
              "unit" => unit_type
              },
              solvent
            ]
        }
        let(:solvent) { {"quantity" => 0, "type" => "solvent", "unit" => "ul"} }
        let(:unit_type) { "mole" }
        let(:aliquot_type) { "NA" }
        let!(:quantity) { 100 }
        let(:volume) { 100 }
        let(:source_tube1_uuid) { '22222222-3333-4444-1111-000000000000'.tap do |uuid|
          store.with_session do |session|
            quantity = 100
            tube = Lims::Core::Laboratory::Tube.new
            L=Lims::Core::Laboratory
#            (1..5).each do |i|
              sample = L::Sample.new(:name => "sample 1")
              aliquot = L::Aliquot.new(:sample => sample, :quantity => 100, :type => aliquot_type)
              tube << aliquot
#            end
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
                              "aliquot_type" => "NA"}
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
              :sources => {
                "tubes" => [
                  {"tube" => {
                    "actions" => {
                      "create" => source_tube1_url,
                      "read" => source_tube1_url,
                      "update" => source_tube1_url,
                      "delete" => source_tube1_url
                    },
                    "uuid" => source_tube1_uuid,
                    "aliquots" => aliquot_array_source
                  }}
                ]
              },
              :result => {
                "tubes" => [
                  {"tube" => {
                    "actions" => {
                      "create" => target_tube2_url,
                      "read" => target_tube2_url,
                      "update" => target_tube2_url,
                      "delete" => target_tube2_url
                    },
                    "uuid" => target_tube2_uuid,
                    "aliquots" => aliquot_array_target
                  }}
                ]
              },
              :targets => {
                "tubes" => [
                  {"tube" => {
                    "actions" => {
                      "create" => target_tube2_url,
                      "read" => target_tube2_url,
                      "update" => target_tube2_url,
                      "delete" => target_tube2_url
                    },
                    "uuid" => target_tube2_uuid,
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
