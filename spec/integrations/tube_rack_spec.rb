require 'spec_helper'

require 'lims-api/context_service'
require 'lims-core'
require 'lims-core/persistence/sequel'

require 'integrations/lab_resource_shared'
require 'integrations/spec_helper'


module Lims::Core::Laboratory
  shared_examples_for "with saved tube rack with tubes" do
    include_context "has standard dimensions"
    include_context "with tube"
    subject do
      described_class.new(:number_of_rows => number_of_rows, :number_of_columns => number_of_columns)
    end

    let!(:uuid) {
      "11111111-2222-3333-4444-555555555555".tap do |uuid|
        store.with_session do |session|
          subject["B5"] = session[tube_uuid]
          session << subject
          set_uuid(session, subject, uuid)
        end
      end
    }
  end


  shared_examples_for "with tube" do
    let(:tube) { Lims::Core::Laboratory::Tube.new }
    let!(:tube_uuid) {
      '11111111-2222-3333-4444-888888888888'.tap do |uuid|
        store.with_session do |session|
          session << tube
          ur = session.new_uuid_resource_for(tube)
          ur.send(:uuid=, uuid)
        end
      end
    }
  end


  shared_context "for empty tube rack" do
    let(:parameters) { {:tube_rack => dimensions} }
    let(:tubes_hash) { {} }
  end

  shared_context "for tube rack with tubes" do
    include_context "with tube"
    let(:tubes) { {"A1" => tube_uuid} } 
    let(:parameters) { {:tube_rack => dimensions.merge(:tubes => tubes)} }
    let(:tubes_hash) { 
      path = "http://example.org/#{tube_uuid}"
      {"A1" => 
       {"actions" => 
        {"read" => path,
        "create" => path,
        "update" => path,
        "delete" => path}}} 
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


  describe TubeRack do
    include_context "use core context service", :tube_rack_slots, :tube_aliquots, :aliquots, :samples, :tubes, :tube_racks
    include_context "JSON"
    let(:model) { "tube_racks" }

    context "#create" do
      include_context "has standard dimensions"
      context "with empty tube rack" do
        include_context "for empty tube rack"
        include_context "expected tube rack JSON"
        it_behaves_like "creating a resource"
      end

      context "with tubes in the tube rack" do
        include_context "for tube rack with tubes"
        include_context "expected tube rack JSON"
        it_behaves_like "creating a resource"
      end
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
        include_context "with saved tube rack with tubes"
        let(:expected_size) { 1 }
        let(:rack_action_path) { "http://example.org/#{uuid}" }
        let(:tube_action_path) { "http://example.org/#{tube_uuid}" }
        let(:viewed_tube) { 
                            {"actions" => 
                             {"read" => tube_action_path,
                              "update" => tube_action_path,
                              "delete" => tube_action_path,
                              "create" => tube_action_path}}}
        let(:expected_tube_racks) {[
          {"tube_rack" => 
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
            }}]}

        it "displays a page" do
          get(url).body.should match_json(expected_page_json)
        end
      end
    end

    
    context "#transfer between source and target tube racks" do
      let(:url) { "/actions/tube_rack_transfer" }

      context "with empty parameters" do
        let(:parameters) { {} }
        let(:expected_json) { {"errors" => 
                               {"source" => "invalid",
                               "target" => "invalid",
                               "transfer_map" => "invalid"}} }
        it_behaves_like "an invalid core action", 422
      end

      context "with valid transfer map" do
        include_context "with saved tube rack with tubes"
        let(:target_tube_uuid) {
          '11111111-1234-4567-8910-888888888888'.tap do |uuid|
            store.with_session do |session|
              tube = Lims::Core::Laboratory::Tube.new
              session << tube
              ur = session.new_uuid_resource_for(tube)
              ur.send(:uuid=, uuid)
            end
          end
        }
        let(:target_uuid) {
          '11111111-2222-3333-1111-000000000000'.tap do |uuid|
            store.with_session do |session|
              tube_rack = Lims::Core::Laboratory::TubeRack.new(:number_of_rows => 8, :number_of_columns => 12)
              tube_rack["E9"] = session[target_tube_uuid] 
              set_uuid(session, tube_rack, uuid)
            end
          end
        }

        let(:transfer_map) { {"B5" => "E9"} }
        let(:parameters) { {:tube_rack_transfer => 
                            {:source_uuid => uuid,
                             :target_uuid => target_uuid,
                             :transfer_map => transfer_map}} }        
        let(:expected_source_tubes) { 
          tube_action_path = "http://example.org/#{tube_uuid}"
          {"B5" => 
           {"actions" => 
            {"read" => tube_action_path,
             "update" => tube_action_path,
             "delete" => tube_action_path,
             "create" => tube_action_path}}}
        }

        let(:expected_target_tubes) { 
          tube_action_path = "http://example.org/#{target_tube_uuid}"
          {"E9" => 
           {"actions" => 
            {"read" => tube_action_path,
             "update" => tube_action_path,
             "delete" => tube_action_path,
             "create" => tube_action_path}}}
        }

        let(:expected_json) {
              source_url = "http://example.org/#{uuid}"
              target_url = "http://example.org/#{target_uuid}"
              {:tube_rack_transfer =>
                {:actions => {},
                  :user => "user",
                  :application => "application",
                  :result => { "tube_rack" => { "actions" => {"read" => target_url,
                    "update" => target_url,
                    "delete" => target_url,
                    "create" => target_url} ,
                    "uuid" => target_uuid,
                    "number_of_rows" => number_of_rows,
                    "number_of_columns" => number_of_columns,
                    "tubes"=> expected_target_tubes}
                  },
                  :source => {"tube_rack" => {"actions" => {"read" => source_url,
                    "update" => source_url,
                    "delete" => source_url,
                    "create" => source_url} ,
                    "uuid" => uuid,
                    "number_of_rows" => number_of_rows,
                    "number_of_columns" => number_of_columns,
                    "tubes"=> expected_source_tubes}},
                  :target => { "tube_rack" => { "actions" => {"read" => target_url,
                    "update" => target_url,
                    "delete" => target_url,
                    "create" => target_url} ,
                    "uuid" => target_uuid,
                    "number_of_rows" => number_of_rows,
                    "number_of_columns" => number_of_columns,
                    "tubes"=> expected_target_tubes}},
                    :transfer_map => transfer_map 
                }
              }
        }
 
        it_behaves_like "a valid core action"
      end
    end


    context "#move tube between source and target tube racks" do
      let(:url) { "/actions/tube_rack_move" }

      context "with empty parameters" do
        let(:parameters) { {} }
        let(:expected_json) { {"errors" => 
                               {"source" => "invalid",
                                "target" => "invalid",
                                "move_map" => "invalid"}} }
        it_behaves_like "an invalid core action", 422
      end

      context "with valid move map" do
        include_context "with saved tube rack with tubes"
        let(:target_uuid) {
          '11111111-2222-3333-1111-000000000000'.tap do |uuid|
            store.with_session do |session|
              tube_rack = Lims::Core::Laboratory::TubeRack.new(:number_of_rows => 8, :number_of_columns => 12)
              set_uuid(session, tube_rack, uuid)
            end
          end
        }

        let(:move_map) { {"B5" => "E9"} }
        let(:parameters) { {:tube_rack_move => 
                            {:source_uuid => uuid,
                             :target_uuid => target_uuid,
                             :move_map => move_map}} }        
        let(:expected_tubes) { 
          tube_action_path = "http://example.org/#{tube_uuid}"
          {"E9" => 
           {"actions" => 
            {"read" => tube_action_path,
             "update" => tube_action_path,
             "delete" => tube_action_path,
             "create" => tube_action_path}}}
        }

        let(:expected_json) {
              source_url = "http://example.org/#{uuid}"
              target_url = "http://example.org/#{target_uuid}"
              {:tube_rack_move =>
                {:actions => {},
                  :user => "user",
                  :application => "application",
                  :result => { "tube_rack" => { "actions" => {"read" => target_url,
                    "update" => target_url,
                    "delete" => target_url,
                    "create" => target_url} ,
                    "uuid" => target_uuid,
                    "number_of_rows" => number_of_rows,
                    "number_of_columns" => number_of_columns,
                    "tubes"=> expected_tubes}
                  },
                  :source => {"tube_rack" => {"actions" => {"read" => source_url,
                    "update" => source_url,
                    "delete" => source_url,
                    "create" => source_url} ,
                    "uuid" => uuid,
                    "number_of_rows" => number_of_rows,
                    "number_of_columns" => number_of_columns,
                    "tubes"=> {}}},
                  :target => { "tube_rack" => { "actions" => {"read" => target_url,
                    "update" => target_url,
                    "delete" => target_url,
                    "create" => target_url} ,
                    "uuid" => target_uuid,
                    "number_of_rows" => number_of_rows,
                    "number_of_columns" => number_of_columns,
                    "tubes"=> expected_tubes}},
                    :move_map => move_map
                }
              }
        }
 
        it_behaves_like "a valid core action"
      end
 
    end
  end
end

