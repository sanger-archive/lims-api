require 'integrations/spec_helper'
require 'integrations/search_shared'
require 'integrations/lab_resource_shared'

describe Lims::Core::Persistence::Search do
  include_context "use core context service", :aliquots, :tubes, :searches, :labels, :labellables
  include_context "JSON"
  let(:model) { "searches" }

  context "#flowcell" do
    let(:searched_model) { "flowcell" }
    let(:description) { "Search for flowcells" }
    let(:number_of_lanes) { 8 }
    let(:lane_description) { 
      {}.tap do |flowcell|
        (1..number_of_lanes).each do |i|
          flowcell[i.to_s] = []
        end
      end
    }
    let(:asset_type) { Lims::Core::Laboratory::Flowcell }
    let(:asset_parameters) { {:number_of_lanes => number_of_lanes, :lane_description => lane_description} }
    let(:asset_uuids) { ["11111111-1111-0000-0000-000000000000",
                         "11111111-1111-0000-0000-000000000001",
                         "11111111-1111-0000-0000-000000000002",
                         "11111111-1111-0000-0000-000000000003",
                         "11111111-1111-0000-0000-000000000004"] }


    context "with 0 flowcell" do
      let(:criteria) { { :id => [1,3,5] } }
      it_behaves_like "empty search"
    end

    context "with some flowcells" do
      include_context "with saved assets"
      let(:criteria) { { :id => [1,3,4].map { |i| asset_ids[i] } } }
      it_behaves_like "search", ["11111111-1111-0000-0000-000000000001",
                                 "11111111-1111-0000-0000-000000000002",
                                 "11111111-1111-0000-0000-000000000004"]
    end

    context "with some barcoded plates" do
      include_context "with saved assets"
      include_context "with saved labels"
      include_context "search by label"
    end
  end
end
