require 'spec_helper'

require 'lims-api/context_service'
require 'lims-core'
require 'lims-core/persistence/sequel'

require 'integrations/laboratory/lab_resource_shared'
require 'integrations/laboratory/plate_resource_shared'
require 'integrations/spec_helper'

require 'lims-api/resource_shared'


module Lims::Core::Laboratory
  shared_examples_for "with saved tube rack with tubes" do
    include_context "has standard dimensions"
    include_context "with tube and sample"

    def create_new_tube_rack(rack_uuid, slots=["B5"])
      store.with_session do |session|
        tuberack = TubeRack.new(:number_of_rows => number_of_rows, :number_of_columns => number_of_columns)
        slots.each do |slot|
          tuberack[slot] = session[tube_uuid]
        end
        set_uuid(session, tuberack, rack_uuid)
      end
      rack_uuid
    end
  end

  shared_examples_for "with tube and sample" do
    include_context "with saved sample"

    let(:aliquot_type) { "sample" }
    let(:aliquot_quantity) { 10 }
    let(:unit_type) { "mole" }
    let(:tube_type) { "Eppendorf" }
    let(:tube_max_volume) { 2 }
    let(:tube) { Lims::Core::Laboratory::Tube.new(:type => tube_type, :max_volume => tube_max_volume) }
    let!(:tube_uuid) {
      '11111111-2222-3333-4444-999999999999'.tap do |uuid|
        store.with_session do |session|
          tube << Lims::Core::Laboratory::Aliquot.new(:sample => session[sample_uuid], 
                                                      :type => aliquot_type,
                                                      :quantity => aliquot_quantity)
          set_uuid(session, tube, uuid)
        end
      end
    }
  end


  shared_context "for empty tube rack" do
    let(:parameters) { {:tube_rack => dimensions} }
    let(:tubes_hash) { {} }
  end

  shared_context "for tube rack with tubes" do
    include_context "with filled aliquots"
    include_context "with tube and sample"
    let(:tubes) { {tube_location => tube_uuid} } 
    let(:parameters) { {:tube_rack => dimensions.merge(:tubes => tubes)} }
    let(:tubes_hash) { 
      path = "http://example.org/#{tube_uuid}"
      {tube_location => 
       {"actions" => 
        {"read" => path,
        "create" => path,
        "update" => path,
        "delete" => path},
       "uuid" => tube_uuid,
       "type" => tube_type,
       "max_volume" => tube_max_volume,
       "aliquots" => aliquot_array}}
    }
  end

  shared_context "expected tube rack JSON" do
    let(:expected_json) {
      path = "http://example.org/#{uuid}"
      {"tube_rack" => 
       {"actions" =>
        {"read" => path,
         "update" => path,
         "delete" => path,
         "create" => path},
         "uuid" => uuid,
         "number_of_rows" => number_of_rows,
         "number_of_columns" => number_of_columns,
         "tubes" => tubes_hash}}
    }
  end

  shared_context "with a target rack tube" do
    let(:target_tube_type) { "target type" }
    let(:target_tube_max_volume) { 5 }
    let(:target_tube_uuid) {
      "11111111-1111-1111-4444-666666666666".tap do |uuid|
        store.with_session do |session|
          tube = Lims::Core::Laboratory::Tube.new(:type => target_tube_type,
                                                  :max_volume => target_tube_max_volume)
          set_uuid(session, tube, uuid)
        end
      end
    }

    def create_new_target_tube_rack(rack_uuid, with_tube)
      store.with_session do |session|
        tuberack = TubeRack.new(:number_of_rows => number_of_rows, :number_of_columns => number_of_columns)
        tuberack[target_location] = session[target_tube_uuid] if with_tube
        set_uuid(session, tuberack, rack_uuid)
      end
      rack_uuid
    end
  end

  shared_context "expected transfer actions JSON" do
    let(:expected_json) {
      source_url = "http://example.org/#{source_rack1_uuid}"
      target_url = "http://example.org/#{target_rack1_uuid}"
      {
        action_name => {
          :actions => {},
          :user => "user",
          :application => "application",
          :result => { 
            :tube_rack => { 
              :actions => {
                :read => target_url,
                :update => target_url,
                :delete => target_url,
                :create => target_url
              },
              :uuid => target_rack1_uuid,
              :number_of_rows => number_of_rows,
              :number_of_columns => number_of_columns,
              :tubes => target_tubes}
          },
          :source => {
            :tube_rack => {
              :actions => {
                :read => source_url,
                :update => source_url,
                :delete => source_url,
                :create => source_url
              },
              :uuid => source_rack1_uuid,
              :number_of_rows => number_of_rows,
              :number_of_columns => number_of_columns,
              :tubes => source_tubes}
          },
          :target => { 
            :tube_rack => { 
              :actions => {
                :read => target_url,
                :update => target_url,
                :delete => target_url,
                :create => target_url
              },
              :uuid => target_rack1_uuid,
              :number_of_rows => number_of_rows,
              :number_of_columns => number_of_columns,
              :tubes => target_tubes}
          },
          action_map_name => transfer_map
        }
      }
    }
  end

  describe TubeRack do
    include_context "use core context service"
    include_context "JSON"
    let(:model) { "tube_racks" }
    let(:target_location) { "E3" }
    let(:source_rack_uuids) { ["11111111-2222-3333-4444-555555555550",
                               "11111111-2222-3333-4444-555555555551"]
    }
    let(:target_rack_uuids) { ["11111111-2222-3333-4444-666666666660",
                               "11111111-2222-3333-4444-666666666661"]
    }

    context "#create" do
      include_context "has standard dimensions"

      context "with empty tube rack" do
        include_context "for empty tube rack"
        include_context "expected tube rack JSON"
        it_behaves_like "creating a resource"
      end

      context "with tubes in the tube rack" do
        let(:tube_location) { "A1" }
        include_context "for tube rack with tubes"
        include_context "expected tube rack JSON"
        it_behaves_like "creating a resource"
      end
    end


    context "#update" do
      include_context "with saved tube rack with tubes"
      include_context "expected tube rack JSON"
      include_context "for tube rack with tubes"

      let(:uuid) { create_new_tube_rack(source_rack_uuids[0]) }
      let(:tube_location) { "B5" }
      let(:path) { "/#{uuid}" }
      let(:aliquot_type) { "DNA" }
      let(:aliquot_quantity) { 10 }
      let(:parameters) { {:aliquot_type => aliquot_type, :aliquot_quantity => aliquot_quantity} }

      it_behaves_like "updating a resource"
    end


    context "#page" do
      let(:url) { "tube_racks/page=1" }
      let(:action_path) { "http://example.org/tube_racks" }

      let(:expected_page_json) {{
        "actions" => {
          "read" => "#{action_path}/page=1",
          "first" => "#{action_path}/page=1",
          "last" => "#{action_path}/page=-1"},
        "tube_racks" => expected_tube_racks,
        "size" => expected_size
      }}

      context "with no tube rack" do
        let(:expected_tube_racks) { [] }
        let(:expected_size) { 0 }
        it "displays an empty page" do
          get(url).body.should match_json(expected_page_json)
        end
      end

      context "with 1 tube rack" do
        include_context "with filled aliquots"
        let!(:uuid) { create_new_tube_rack(source_rack_uuids[0]) }
        let(:rack_action_path) { "http://example.org/#{uuid}" }
        let(:tube_action_path) { "http://example.org/#{tube_uuid}" }
        let(:viewed_tube) { 
                            {"actions" => 
                             {"read" => tube_action_path,
                              "update" => tube_action_path,
                              "delete" => tube_action_path,
                              "create" => tube_action_path},
                            "uuid" => tube_uuid,
                            "type" => tube_type,
                            "max_volume" => tube_max_volume,
                            "aliquots" => aliquot_array}}
        let(:expected_tube_racks) {[
           {"actions" => 
            {"read" => rack_action_path,
             "update" => rack_action_path,
             "delete" => rack_action_path,
             "create" => rack_action_path
            },
            "uuid" => uuid,
            "number_of_rows" => number_of_rows,
            "number_of_columns" => number_of_columns,
            "tubes" => {"B5"=>viewed_tube}
            }]}
        let(:expected_size) { 1 }
        include_context "with saved tube rack with tubes"
        it "displays a page" do
          get(url).body.should match_json(expected_page_json)
        end
      end
    end


    context "#transfer" do
      include_context "with filled aliquots"
      let(:url) { "/actions/tube_rack_transfer" }

      context "with empty parameters" do
        let(:parameters) { {} }
        let(:expected_json) { {
          :errors => {
            :source => "invalid",
            :target => "invalid",
            :transfer_map => "invalid"}
        }}
        it_behaves_like "an invalid core action", 422
      end

      context "with correct parameters" do
        include_context "with saved tube rack with tubes"
        include_context "with a target rack tube"
        include_context "expected transfer actions JSON"

        let(:source_rack1_uuid) { create_new_tube_rack(source_rack_uuids[0]) }
        let(:target_rack1_uuid) { create_new_target_tube_rack(target_rack_uuids[0], true) }
        let(:transfer_map) { {"B5" => "E3"} }
        let(:action_name) { "tube_rack_transfer" }
        let(:action_map_name) { "transfer_map" }
        let(:parameters) { {
          :tube_rack_transfer => {
            :source_uuid => source_rack1_uuid,
            :target_uuid => target_rack1_uuid,
            :transfer_map => transfer_map}
        }}
        let(:remaining_aliquot_quantity) { 0 }
        let(:source_tubes) {
          path = "http://example.org/#{tube_uuid}"
          path_sample = "http://example.org/#{sample_uuid}"
          {
            "B5" => {"actions" => 
                     {"read" => path,
                      "create" => path,
                      "update" => path,
                      "delete" => path},
                      "uuid" => tube_uuid,
                      "type" => tube_type,
                      "max_volume" => tube_max_volume,
                      "aliquots" => [ { "sample"=> {"actions" => { "read" => path_sample,
                                                                   "update" => path_sample,
                                                                   "delete" => path_sample,
                                                                   "create" => path_sample },
                                                                   "uuid" => sample_uuid,
                                                                   "name" => sample_name},
                                                                   "type" => aliquot_type,
                                                                   "quantity" => remaining_aliquot_quantity,
                                                                   "unit" => unit_type} ]}}
        } 
        let(:target_tubes) {
          path = "http://example.org/#{target_tube_uuid}"
          {
            "E3" => {"actions" => 
                     {"read" => path,
                      "create" => path,
                      "update" => path,
                      "delete" => path},
                      "uuid" => target_tube_uuid,
                      "type" => target_tube_type,
                      "max_volume" => target_tube_max_volume,
                      "aliquots" => aliquot_array}}
        }
        it_behaves_like "a valid core action"
      end
    end

    context "#move" do
      include_context "with filled aliquots"
      let(:url) { "/actions/tube_rack_move" }

      context "with empty parameters" do
        let(:parameters) { {} }
        let(:expected_json) { {
          "errors" => {
            "moves" => "invalid"}
        }}
        it_behaves_like "an invalid core action", 422
      end

      context "with correct parameters" do
        context "a single tube rack to another tube rack move" do
          include_context "with saved tube rack with tubes"
          include_context "with a target rack tube"

          let(:source_rack1_uuid) { create_new_tube_rack(source_rack_uuids[0]) }
          let(:target_rack1_uuid) { create_new_target_tube_rack(target_rack_uuids[0], false) }
          let(:source_location) { "B5" }
          let(:moves) { [
            { "source_uuid" => source_rack1_uuid,
              "source_location" => source_location,
              "target_uuid" => target_rack1_uuid,
              "target_location" => "E9"
            }
            ]
          }
          let(:parameters) { { :tube_rack_move => { :moves => moves } } }
          let(:source_tubes) { {} }
          let(:target_tubes) {
            path = "http://example.org/#{tube_uuid}"
            {
              "E9" => {"actions" =>
                       {"read" => path,
                        "create" => path,
                        "update" => path,
                        "delete" => path},
                        "uuid" => tube_uuid,
                        "type" => tube_type,
                        "max_volume" => tube_max_volume,
                        "aliquots" => aliquot_array}}
          }

          let(:expected_json) {
            target_url = "http://example.org/#{target_rack1_uuid}"
            {
              :tube_rack_move => {
                :actions => {},
                :user => "user",
                :application => "application",
                :result => [{
                  "tube_rack" => {
                    "actions" => {
                      "read" => target_url,
                      "create" => target_url,
                      "update" => target_url,
                      "delete" => target_url,
                    },
                    "uuid" => target_rack1_uuid,
                    "number_of_rows" => number_of_rows,
                    "number_of_columns" => number_of_columns,
                    "tubes" => target_tubes}
                }],
                :moves => moves
              }
            }
          }

          it_behaves_like "a valid core action"
        end

        context "multiply tube rack to a tube rack move", :focus => true do
          include_context "with saved tube rack with tubes"
          include_context "with a target rack tube"

          let(:source_locations_rack1) { ["A1", "B2"] }
          let(:source_locations_rack2) { ["C5", "E8"] }
          let(:target_locations_rack1) { ["B9", "D4"] }
          let(:target_locations_rack2) { ["F3", "A9"] }
          let(:source_rack1_uuid) { create_new_tube_rack(source_rack_uuids[0], source_locations_rack1) }
          let(:source_rack2_uuid) { create_new_tube_rack(source_rack_uuids[1], source_locations_rack2) }
          let(:target_rack1_uuid) { create_new_target_tube_rack(target_rack_uuids[0], false) }
          let(:target_rack2_uuid) { create_new_target_tube_rack(target_rack_uuids[1], false) }
          let(:moves) { [
            { "source_uuid" => source_rack1_uuid,
              "source_location" => source_locations_rack1[0],
              "target_uuid" => target_rack1_uuid,
              "target_location" => target_locations_rack1[0]
            },
            { "source_uuid" => source_rack1_uuid,
              "source_location" => source_locations_rack1[1],
              "target_uuid" => target_rack2_uuid,
              "target_location" => target_locations_rack2[0]
            },
            { "source_uuid" => source_rack2_uuid,
              "source_location" => source_locations_rack2[0],
              "target_uuid" => target_rack1_uuid,
              "target_location" => target_locations_rack1[1]
            },
            { "source_uuid" => source_rack2_uuid,
              "source_location" => source_locations_rack2[1],
              "target_uuid" => target_rack2_uuid,
              "target_location" => target_locations_rack2[1]
            }
            ]
          }
          let(:parameters) { { :tube_rack_move => { :moves => moves } } }
          let(:source_tubes) { {} }
          let(:target1_tubes) {
            path = "http://example.org/#{tube_uuid}"
            {
              target_locations_rack1[0] => {"actions" =>
                       {"read" => path,
                        "create" => path,
                        "update" => path,
                        "delete" => path},
                        "uuid" => tube_uuid,
                        "type" => tube_type,
                        "max_volume" => tube_max_volume,
                        "aliquots" => aliquot_array},
              target_locations_rack1[1] => {"actions" =>
                       {"read" => path,
                        "create" => path,
                        "update" => path,
                        "delete" => path},
                        "uuid" => tube_uuid,
                        "type" => tube_type,
                        "max_volume" => tube_max_volume,
                        "aliquots" => aliquot_array}
            }
          }
          let(:target2_tubes) {
            path = "http://example.org/#{tube_uuid}"
            {
              target_locations_rack2[0] => {"actions" =>
                       {"read" => path,
                        "create" => path,
                        "update" => path,
                        "delete" => path},
                        "uuid" => tube_uuid,
                        "type" => tube_type,
                        "max_volume" => tube_max_volume,
                        "aliquots" => aliquot_array},
              target_locations_rack2[1] => {"actions" =>
                       {"read" => path,
                        "create" => path,
                        "update" => path,
                        "delete" => path},
                        "uuid" => tube_uuid,
                        "type" => tube_type,
                        "max_volume" => tube_max_volume,
                        "aliquots" => aliquot_array}
            }
          }

          let(:expected_json) {
            target1_url = "http://example.org/#{target_rack1_uuid}"
            target2_url = "http://example.org/#{target_rack2_uuid}"
            {
              :tube_rack_move => {
                :actions => {},
                :user => "user",
                :application => "application",
                :result => [
                  {"tube_rack" => {
                    "actions" => {
                      "read" => target1_url,
                      "create" => target1_url,
                      "update" => target1_url,
                      "delete" => target1_url,
                    },
                    "uuid" => target_rack1_uuid,
                    "number_of_rows" => number_of_rows,
                    "number_of_columns" => number_of_columns,
                    "tubes" => target1_tubes}
                  },
                  {"tube_rack" => {
                    "actions" => {
                      "read" => target2_url,
                      "create" => target2_url,
                      "update" => target2_url,
                      "delete" => target2_url,
                    },
                    "uuid" => target_rack2_uuid,
                    "number_of_rows" => number_of_rows,
                    "number_of_columns" => number_of_columns,
                    "tubes" => target2_tubes}
                  }
                ],
                :moves => moves
              }
            }
          }

          it_behaves_like "a valid core action"
        end
      end

    end
  end
end

