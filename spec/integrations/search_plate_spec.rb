require 'integrations/spec_helper'
require 'integrations/search_shared'
require 'integrations/lab_resource_shared'

describe "Lims::Core::Persistence::Search"do
  include_context "use core context service", :wells, :aliquots, :plates, :samples, :searches, :labels, :labellables
  include_context "JSON"
  let(:model) { "searches" }

  context "#plate" do
    let(:searched_model) { "plate" }
    let(:description) { "description" }
    include_context "has standard dimensions"
    let(:asset) { lambda { Lims::Core::Laboratory::Plate.new(dimensions) } }
    context "with 0 plate" do
      let(:criteria) { { :id => [1,2,5,7,8] } }
      it_behaves_like "empty search"
    end

    context "with some plates" do
      include_context "with 10 saved assets"
      let(:criteria) { { :id => [1,2,5,7,8].map { |i| asset_ids[i] } }}
      it_behaves_like "search", 5
    end

    context "with some barcoded plates" do
      include_context "do the searching"
    end
  end
end
