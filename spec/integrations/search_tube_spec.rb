require 'integrations/spec_helper'
require 'integrations/search_shared'
require 'integrations/lab_resource_shared'

describe Lims::Core::Persistence::Search do
  include_context "use core context service", :aliquots, :tubes, :searches, :labels, :labellables
  include_context "JSON"
  let(:model) { "searches" }

  context "#tube" do
    let(:searched_model) { "tube" }
    let(:description) { "Search for tubes" }
    let(:asset) { lambda { Lims::Core::Laboratory::Tube.new } }
    context "with 0 tube" do
      let(:criteria) { { :id => [1,3,5,7,9] } }
      it_behaves_like "empty search"
    end

    context "with some tubes" do
      include_context "with 10 saved assets"
      let(:criteria) { { :id => [1,3,5,7,9].map { |i| asset_ids[i] } } }
      it_behaves_like "search", 5
    end

    context "with some barcoded tubes" do
      include_context "do the searching"
    end
  end
end
