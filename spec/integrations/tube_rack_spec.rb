require 'spec_helper'

require 'lims-api/context_service'
require 'lims-core'
require 'lims-core/persistence/sequel'

require 'integrations/lab_resource_shared'
require 'integrations/spec_helper'

require 'lims-api/resource_shared'


module Lims::Core::Laboratory
  shared_examples_for "with saved tube rack with tubes" do
    include_context "has standard dimensions"
    include_context "with tube and sample"

    subject do
      described_class.new(:number_of_rows => number_of_rows, :number_of_columns => number_of_columns)
    end

    let!(:uuid) {
      "11111111-2222-3333-4444-555555555555".tap do |uuid|
        store.with_session do |session|
          subject["B5"] = session[tube_uuid]
          set_uuid(session, subject, uuid)
        end
      end
    }
  end


  shared_examples_for "with tube and sample" do
    include_context "with saved sample"

    let(:aliquot_type) { "sample" }
    let(:aliquot_quantity) { 10 }
    let(:unit_type) { "mole" }
    let(:tube) { Lims::Core::Laboratory::Tube.new }
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

  shared_context "with a target rack tube" do |with_tube|
    let(:target_tube_uuid) {
      "11111111-1111-1111-4444-666666666666".tap do |uuid|
        store.with_session do |session|
          tube = Lims::Core::Laboratory::Tube.new
          set_uuid(session, tube, uuid)
        end
      end
    }

    let!(:target_uuid) {
      "11111111-2222-3333-4444-666666666666".tap do |uuid|
        store.with_session do |session|
          rack = Lims::Core::Laboratory::TubeRack.new(:number_of_rows => number_of_rows, :number_of_columns => number_of_columns)
          rack["E3"] = session[target_tube_uuid] if with_tube
          set_uuid(session, rack, uuid)
        end
      end
    }
  end

  shared_context "expected transfer actions JSON" do
    let(:expected_json) {
      source_url = "http://example.org/#{uuid}"
      target_url = "http://example.org/#{target_uuid}"
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
              :uuid => target_uuid,
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
              :uuid => uuid,
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
              :uuid => target_uuid,
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
        let(:rack_action_path) { "http://example.org/#{uuid}" }
        let(:tube_action_path) { "http://example.org/#{tube_uuid}" }
        let(:viewed_tube) { 
                            {"actions" => 
                             {"read" => tube_action_path,
                              "update" => tube_action_path,
                              "delete" => tube_action_path,
                              "create" => tube_action_path},
                            "uuid" => tube_uuid,
                            "aliquots" => aliquot_array}}
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
        include_context "with a target rack tube", true
        include_context "expected transfer actions JSON"

        let(:transfer_map) { {"B5" => "E3"} }
        let(:action_name) { "tube_rack_transfer" }
        let(:action_map_name) { "transfer_map" }
        let(:parameters) { {
          :tube_rack_transfer => {
            :source_uuid => uuid,
            :target_uuid => target_uuid,
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
          :errors => {
            :source => "invalid",
            :target => "invalid",
            :move_map => "invalid"}
        }}
        it_behaves_like "an invalid core action", 422
      end

      context "with correct parameters" do
        include_context "with saved tube rack with tubes"
        include_context "with a target rack tube"
        include_context "expected transfer actions JSON"

        let(:transfer_map) { {"B5" => "E9"} }
        let(:action_name) { "tube_rack_move" }
        let(:action_map_name) { "move_map" }
        let(:parameters) { {
          :tube_rack_move => {
            :source_uuid => uuid,
            :target_uuid => target_uuid,
            :move_map => transfer_map}
        }}
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
                      "aliquots" => aliquot_array}}
        }
 
        it_behaves_like "a valid core action"
      end
    end
  end
end

