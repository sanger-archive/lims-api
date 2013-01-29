require 'integrations/spec_helper'
require 'integrations/search_shared'
require 'integrations/lab_resource_shared'

describe Lims::Core::Persistence::Search do
  include_context "use core context service", :aliquots, :tubes, :searches, :labels, :labellables
  include_context "JSON"
  let(:model) { "searches" }

  context "#tube" do
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
    let(:flowcell_parameters) { { :number_of_lanes => number_of_lanes, 
                                  :lane_description => lane_description } }
    let(:asset) { lambda { Lims::Core::Laboratory::Flowcell.new(flowcell_parameters) } }
    context "with 0 flowcell" do
      let(:criteria) { { :id => [1,3,5,7,9] } }
      it_behaves_like "empty search"
    end

    context "with some flowcells" do
      include_context "with 10 saved assets"
      let(:criteria) { { :id => [1,3,5,7,9].map { |i| asset_ids[i] } } }
      it_behaves_like "search", 5
    end

    context "with some barcoded flowcells" do
      include_context "do the searching"
    end
  end
end
