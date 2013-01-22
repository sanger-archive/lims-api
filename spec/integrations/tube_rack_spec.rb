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
      described_class.new(:number_of_rows => number_of_rows, :number_of_columns => number_of_columns).tap do |rack|
        rack["A1"] = tube_uuid 
      end
    end

    let!(:uuid) {
      "11111111-2222-3333-4444-555555555555".tap do |uuid|
        store.with_session do |session|
          session << subject
          set_uuid(session, subject, uuid)
        end
      end
    }
  end


  shared_examples_for "with tube" do
    let(:tube) { Lims::Core::Laboratory::Tube.new }
    let(:tube_uuid) {
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
    let(:tubes_description) { {"A1" => tube_uuid} } 
    let(:parameters) { {:tube_rack => dimensions.merge(:tubes_description => tubes_description)} }
    let(:tubes_hash) { {} }
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
    include_context "use core context service", :tubes, :tube_racks 
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
      let(:url) { "plates/page=1" }
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
        let(:viewed_tube) {{"tube" => 
                            {"actions" => 
                             {"read" => tube_action_path,
                              "update" => tube_action_path,
                              "delete" => tube_action_path,
                              "create" => tube_action_path}}}}
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
            "tubes" => {
              "A1"=>nil,"A2"=>nil,"A3"=>nil,"A4"=>nil,"A5"=>nil,"A6"=>nil,"A7"=>nil,"A8"=>nil,"A9"=>nil,"A10"=>nil,"A11"=>nil,"A12"=>nil,
              "B1"=>nil,"B2"=>nil,"B3"=>nil,"B4"=>nil,"B5"=>viewed_tube,"B6"=>nil,"B7"=>nil,"B8"=>nil,"B9"=>nil,"B10"=>nil,"B11"=>nil,"B12"=>nil,
              "C1"=>nil,"C2"=>nil,"C3"=>nil,"C4"=>nil,"C5"=>nil,"C6"=>nil,"C7"=>nil,"C8"=>nil,"C9"=>nil,"C10"=>nil,"C11"=>nil,"C12"=>nil,
              "D1"=>nil,"D2"=>nil,"D3"=>nil,"D4"=>nil,"D5"=>nil,"D6"=>nil,"D7"=>nil,"D8"=>nil,"D9"=>nil,"D10"=>nil,"D11"=>nil,"D12"=>nil,
              "E1"=>nil,"E2"=>nil,"E3"=>nil,"E4"=>nil,"E5"=>nil,"E6"=>nil,"E7"=>nil,"E8"=>nil,"E9"=>nil,"E10"=>nil,"E11"=>nil,"E12"=>nil,
              "F1"=>nil,"F2"=>nil,"F3"=>nil,"F4"=>nil,"F5"=>nil,"F6"=>nil,"F7"=>nil,"F8"=>nil,"F9"=>nil,"F10"=>nil,"F11"=>nil,"F12"=>nil,
              "G1"=>nil,"G2"=>nil,"G3"=>nil,"G4"=>nil,"G5"=>nil,"G6"=>nil,"G7"=>nil,"G8"=>nil,"G9"=>nil,"G10"=>nil,"G11"=>nil,"G12"=>nil,
              "H1"=>nil,"H2"=>nil,"H3"=>nil,"H4"=>nil,"H5"=>nil,"H6"=>nil,"H7"=>nil,"H8"=>nil,"H9"=>nil,"H10"=>nil,"H11"=>nil,"H12"=>nil},
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

