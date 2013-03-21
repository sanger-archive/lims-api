shared_context "execute search" do
  let(:parameters) { {:search => {:description => description, :model => searched_model, :criteria => criteria}} }
  let(:search_result) { JSON.parse(post("/#{model}", parameters.to_json).body) }
  let(:first_page) { search_result["search"]["actions"]["first"] }
  let(:result_first_page) { get(first_page) }
  let!(:found_resources) { JSON.parse(result_first_page.body) }
end


shared_examples_for "search" do |expected_uuids|
  context "create a search resource" do
    let(:parameters) { {:search => {:description => description, :model => searched_model, :criteria => criteria}} }
    let(:expected_json) {
      path = "http://example.org/#{uuid}"
      {"search" => {"actions" => {"read" => path,
                                  "first" => "#{path}/page=1",
                                  "last" => "#{path}/page=-1"},
                    "uuid" => uuid}}
    }
    it_behaves_like "creating a resource"
  end

  context "found resources" do
    include_context "execute search"

    it "has actions" do
      search_result["search"]["actions"].should be_a(Hash)      
    end

    it "is successful" do
      result_first_page.status.should == 200      
    end

    it "gets the expected resources" do
      found_resources["size"] == expected_uuids.size 
      found_uuids = found_resources[searched_model.pluralize].map { |resource| resource["uuid"] }
      found_uuids.sort.should == expected_uuids.sort
    end
 end
end


shared_examples_for "empty search" do
  it_behaves_like "search", [] 
end


shared_context "with saved assets" do 
  let!(:asset_ids) do
    store.with_session do |session|
      asset_uuids.map do |uuid|
        new_asset = asset_type.new(asset_parameters)                
        set_uuid(session, new_asset, uuid)
        lambda { session.id_for(new_asset) }
      end
    end.map { |l| l.call }
  end
end


shared_context "with saved labels" do
  let(:labellable_type) { "resource" }
  let(:label_position) { "front barcode" }
  let(:label_type) { "sanger-barcode" }

  let(:labellable_uuids) {
    (0..asset_uuids.size).map { |i| "22221111-2222-3333-4444-88888888888#{i}" }
  }
  let!(:labellable_ids) {
    store.with_session do |session|
      asset_uuids.zip(labellable_uuids) do |asset_uuid, labellable_uuid|
        labellable = Lims::Core::Laboratory::Labellable.new(:name => asset_uuid, :type => labellable_type)
        labellable[label_position] = Lims::Core::Laboratory::SangerBarcode.new(:value => asset_uuid)
        set_uuid(session, labellable, labellable_uuid)
      end
    end
  }
end


shared_context "with saved orders" do
  include_context "with saved batches"
  let(:basic_parameters) { {:creator => Lims::Core::Organization::User.new, :study => Lims::Core::Organization::Study.new} }
  let(:orders) { {
    "99999999-1111-0000-0000-000000000000" => 
    Lims::Core::Organization::Order.new(basic_parameters.merge(:pipeline => "P1")).tap do |o|
      o.add_source("source1", "11111111-1111-0000-0000-000000000000")
      o.add_source("source2", "11111111-1111-0000-0000-000000000001")
      o.add_target("target1", "11111111-1111-0000-0000-000000000002")
      o.build!
      o.start!
    end,
    "99999999-2222-0000-0000-000000000000" => 
    Lims::Core::Organization::Order.new(basic_parameters.merge(:pipeline => "P2")).tap do |o|
      o.add_source("source1", "11111111-1111-0000-0000-000000000001")
      o.add_source("source2", "11111111-1111-0000-0000-000000000003")
      o.add_target("target3", "11111111-1111-0000-0000-000000000004")
      o.build!
    end,
    "99999999-3333-0000-0000-000000000000" => 
    Lims::Core::Organization::Order.new(basic_parameters.merge(:pipeline => "P3")).tap do |o|
      o.add_source("source1", "11111111-1111-0000-0000-000000000000")
      o.add_source("source3", "11111111-1111-0000-0000-000000000001")
      o.add_target("target2", "11111111-1111-0000-0000-000000000002")
      o.build!
      o.start!
    end
  } }

  let!(:uuids) {
    store.with_session do |session|
      orders.each do |uuid, order|
        set_uuid(session, order, uuid)
        order[:source2].first.batch = session[batch_uuids[0]] if order.pipeline == 'P1'
        order[:source1].first.batch = session[batch_uuids[1]] if order.pipeline == 'P2'
        order[:target2].first.batch = session[batch_uuids[0]] if order.pipeline == 'P3'
      end
    end
  }
end

shared_context "with saved batches" do
  let!(:batch_uuids) do
    ['11111111-2222-2222-3333-000000000000', '11111111-2222-2222-3333-111111111111'].tap do |uuids|
      uuids.each do |uuid|
        store.with_session do |session|
          batch = Lims::Core::Organization::Batch.new
          session << batch
          ur = session.new_uuid_resource_for(batch)
          ur.send(:uuid=, uuid)
        end
      end
    end
  end
end

shared_context "search by label" do
  context "searching by their position" do
    let(:criteria) { { :label => { :position => label_position } } }
    it_behaves_like "search", ["11111111-1111-0000-0000-000000000000",
                         "11111111-1111-0000-0000-000000000001",
                         "11111111-1111-0000-0000-000000000002",
                         "11111111-1111-0000-0000-000000000003",
                         "11111111-1111-0000-0000-000000000004"] 
  end

  context "searching by their uuid (value) and type" do
    let(:criteria) { { :label => { :value => asset_uuids[0], :type => label_type } } }
    it_behaves_like "search", ["11111111-1111-0000-0000-000000000000"]
  end

  context "searching by their uuid (value) and position" do
    let(:criteria) { { :label => { :value => asset_uuids[0], :position => label_position } } }
    it_behaves_like "search", ["11111111-1111-0000-0000-000000000000"]
  end
end


shared_context "search by order" do  
  context "by order pipeline" do
    let(:criteria) { {:order => {:pipeline => "P1"}} }
    it_behaves_like "search", ["11111111-1111-0000-0000-000000000000", 
                               "11111111-1111-0000-0000-000000000001",
                               "11111111-1111-0000-0000-000000000002"]
  end

  context "by order status" do
    let(:criteria) { {:order => {:status => "in_progress"}} }
    it_behaves_like "search", ["11111111-1111-0000-0000-000000000000", 
                               "11111111-1111-0000-0000-000000000001",
                               "11111111-1111-0000-0000-000000000002"]
  end

  context "by order items" do
    let(:criteria) { {:order => {:item => {:status => "pending"}}} }
    it_behaves_like "search", ["11111111-1111-0000-0000-000000000002",
                               "11111111-1111-0000-0000-000000000004"]
  end
end
