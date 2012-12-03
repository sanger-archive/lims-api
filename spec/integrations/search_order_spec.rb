require 'integrations/spec_helper'
require 'integrations/lab_resource_shared'

module Lims::Core

  shared_examples_for "search orders" do |count|
    let(:parameters) { {:description => description, :model => searched_model, :criteria => criteria} }
    let(:result) { post(url, parameters.to_json) }

    context "as a resource" do
      let(:expected_json) do
        path = "http://example.org/#{uuid}"
        { "search" => {"actions" => {"read" => path,
                                     "first" => "#{path}/page=1",
                                     "last" => "#{path}/page=-1",
        },
        "uuid" => uuid}}
      end
      it_behaves_like "creating a resource", "/searches"
    end

    context "found" do
      let(:first_result_page) { JSON.parse(result.body)["search"]["actions"]["first"] }
      let(:result_page) { get first_result_page } 

      it "should be successful" do
        result.status.should == 200
      end

      it "should have the right number of result" do 
        searched_order = JSON.parse(result_page.body)
        searched_order["size"].should == count
      end 
    end
  end

  shared_context "use saved orders" do
    let(:basic_parameters) { {:creator => Organization::User.new, :study => Organization::Study.new} }
    let(:orders) { {
      "9999-1111-00000000-000000000000" => 
      Organization::Order.new(basic_parameters.merge(:pipeline => "P1")).tap do |o|
        o.add_source("source1", "1111-1111-00000000-000000000000")
        o.add_source("source2", "1111-2222-00000000-000000000000")
        o.add_target("target1", "2222-1111-00000000-000000000000")
        o.build!
        o.start!
      end,
      "9999-2222-00000000-000000000000" => 
      Organization::Order.new(basic_parameters.merge(:pipeline => "P2")).tap do |o|
        o.add_source("source1", "1111-1111-00000000-000000000000")
        o.add_source("source2", "1111-2222-00000000-000000000000")
        o.add_target("target3", "2222-3333-00000000-000000000000")
        o.build!
      end,
      "9999-3333-00000000-000000000000" => 
      Organization::Order.new(basic_parameters.merge(:pipeline => "P3")).tap do |o|
        o.add_source("source1", "1111-1111-00000000-000000000000")
        o.add_source("source3", "1111-3333-00000000-000000000000")
        o.add_target("target2", "2222-2222-00000000-000000000000")
        o.build!
        o.start!
      end
    } }

    let!(:uuids) {
      store.with_session do |session|
        orders.each do |uuid, order|
          set_uuid(session, order, uuid)
        end
      end
    }
  end


  describe Persistence::Search do
    include_context "use core context service", :items, :orders, :studies, :users, :searches
    include_context "JSON"
    include_context "use saved orders"
    let(:url) { "/searches" }
    let(:model) { "searches" }
    let(:searched_model) { "order" }
    let(:description) { "description" }

    context "searchable by item criteria" do
      context "found 1 order" do
        let(:criteria) { {:item => {:uuid => "1111-3333-00000000-000000000000"}} }
        it_behaves_like "search orders", 1            
      end

      context "found 3 orders" do
        let(:criteria) { {:item => {:uuid => "1111-1111-00000000-000000000000"}} }
        it_behaves_like "search orders", 3
      end
    end

    context "searchable by item and order status criteria" do
      let(:criteria) { {:item => {:uuid => "1111-2222-00000000-000000000000"}, :status => "pending"} }
      it_behaves_like "search orders", 1
    end

    context "searchable by role criteria" do
      let(:criteria) { {:item => {:role => %w[target1 target2]}} }
      it_behaves_like "search orders", 2
    end

    context "searchable by item uuid and status" do
      let(:criteria) { {:item => {:uuid => "1111-2222-00000000-000000000000", :status => "done"}} }
      it_behaves_like "search orders", 2
    end

    context "searchable by item uuid, status and role" do
      let(:criteria) { {:item => {:uuid => "1111-2222-00000000-000000000000", :status => "done", :role => "source2"}} }
      it_behaves_like "search orders", 2
    end
  end
end
