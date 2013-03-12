require 'integrations/spec_helper'
require 'integrations/search_shared'
require 'integrations/lab_resource_shared'

describe Lims::Core::Persistence::Search do
  include_context "use core context service"
  include_context "JSON"
  let(:model) { "searches" }

  context "#plate" do
    let(:searched_model) { "plate" }
    let(:description) { "description" }
    include_context "has standard dimensions"
    let(:asset_type) { Lims::Core::Laboratory::Plate }
    let(:asset_parameters) { dimensions }
    let(:asset_uuids) { ["11111111-1111-0000-0000-000000000000",
                         "11111111-1111-0000-0000-000000000001",
                         "11111111-1111-0000-0000-000000000002",
                         "11111111-1111-0000-0000-000000000003",
                         "11111111-1111-0000-0000-000000000004"] }
    include_context "with saved assets"

    context "with 0 plate" do
      let(:criteria) { {:id => [1,2,5]} }
      it_behaves_like "empty search"
    end

    context "with some plates" do
      let(:criteria) { {:id => [1,2,4].map {|i| asset_ids[i]}} }
      it_behaves_like "search", ["11111111-1111-0000-0000-000000000001",
                                 "11111111-1111-0000-0000-000000000002",
                                 "11111111-1111-0000-0000-000000000004"]
    end

    context "with some barcoded plates" do
      include_context "with saved labels"
      include_context "search by label"
    end

    context "with plates in order" do
      include_context "with saved orders"
      include_context "search by order" 
    end

    context "with plates in order assigned to a batch" do
      include_context "with saved orders"
      let(:criteria) { {:batch => {:uuid => batch_uuids[0]}} }
      it_behaves_like "search", ["11111111-1111-0000-0000-000000000001", "11111111-1111-0000-0000-000000000002"]
    end

    context "with plates in order assigned to a batch - second method" do
      include_context "with saved orders"
      let(:criteria) { {:order => {:item => {:batch => {:uuid => batch_uuids[0]}}}} }
      it_behaves_like "search", ["11111111-1111-0000-0000-000000000001", "11111111-1111-0000-0000-000000000002"]
    end
  end
end
