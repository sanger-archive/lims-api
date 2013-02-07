require 'integrations/spec_helper'
require 'integrations/lab_resource_shared'
require 'integrations/search_shared'

module Lims::Core
  describe Persistence::Search do
    include_context "use core context service", :items, :orders, :studies, :users, :searches
    include_context "JSON"
    include_context "with saved orders"

    let(:url) { "/searches" }
    let(:model) { "searches" }
    let(:searched_model) { "order" }
    let(:description) { "description" }

    context "searchable by item criteria" do
      context "found 1 order" do
        let(:criteria) { {:item => {:uuid => "11111111-3333-0000-0000-000000000000"}} }
        let(:expected_uuid) { "99999999-3333-0000-0000-000000000000"}
        it_behaves_like "search", ["99999999-3333-0000-0000-000000000000"]
      end

      context "found 3 orders" do
        let(:criteria) { {:item => {:uuid => "11111111-1111-0000-0000-000000000000"}} }
      it_behaves_like "search", ["99999999-1111-0000-0000-000000000000", "99999999-2222-0000-0000-000000000000", "99999999-3333-0000-0000-000000000000"]
      end
    end

    context "searchable by item and order status criteria" do
      let(:criteria) { {:item => {:uuid => "11111111-2222-0000-0000-000000000000"}, :status => "pending"} }
      it_behaves_like "search",  ["99999999-2222-0000-0000-000000000000"] # fail
    end

    context "searchable by role criteria" do
      let(:criteria) { {:item => {:role => %w[target1 target2]}} }
      it_behaves_like "search", ["99999999-1111-0000-0000-000000000000", "99999999-3333-0000-0000-000000000000"]
    end

    context "searchable by item uuid and status" do
      let(:criteria) { {:item => {:uuid => "11111111-2222-0000-0000-000000000000", :status => "done"}} }
      it_behaves_like "search", ["99999999-1111-0000-0000-000000000000", "99999999-2222-0000-0000-000000000000"]
    end

    context "searchable by item uuid, status and role" do
      let(:criteria) { {:item => {:uuid => "11111111-2222-0000-0000-000000000000", :status => "done", :role => "source2"}} }
      it_behaves_like "search", ["99999999-1111-0000-0000-000000000000", "99999999-2222-0000-0000-000000000000"]
    end
  end
end
