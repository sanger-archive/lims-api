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
        "delete" => path},
       "uuid" => tube_uuid,
       "aliquots" => []}} 
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
        let(:rack_action_path) { "http://example.org/#{uuid}" }
        let(:tube_action_path) { "http://example.org/#{tube_uuid}" }
        let(:viewed_tube) { 
                            {"actions" => 
                             {"read" => tube_action_path,
                              "update" => tube_action_path,
                              "delete" => tube_action_path,
                              "create" => tube_action_path},
                            "uuid" => tube_uuid,
                            "aliquots" => []}}
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
  end
end

