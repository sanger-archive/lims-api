shared_examples_for "search" do |count|
  context "#search" do
    let(:parameters) { {:search => { :description => description, :model => searched_model, :criteria => criteria}} }
    context "create" do
      let(:expected_json) do
        path = "http://example.org/#{uuid}"
        { "search" => {"actions" => {"read" => path,
                                     "first" => "#{path}/page=1",
                                     "last" => "#{path}/page=-1"},
                       "uuid" => uuid }
        }
      end

      context "as a resource" do
        it_behaves_like "creating a resource"
      end

      pending "decide behavior" do
        # At the moment, /actions/create_search return an action,
        # not the search object itself. Therefore the output is different.
        # The "creating a resource" example can't be used as is. If we keep this way
        context "create via action" do
          it_behaves_like "creating a resource", "/actions/create_search"
        end
      end

      context "saved" do
        let!(:answer) { JSON.parse(post("/#{model}", parameters.to_json).body) }
        let(:actions) { answer["search"]["actions"] }

        it "has actions" do
          actions.should be_a(Hash)
        end

        context "first page" do
          let(:page_answer) { get(actions["first"]) }
          context do
            subject { page_answer }
            its(:status) { should == 200 }
          end

          let(:page) { JSON::parse(page_answer.body) }
          context "content" do
            subject { page }
            pending "debugging purpose" do
              it { should == "not defined" }
            end

            its(:keys) { should == %W[actions size #{searched_model}s] }
            it "should have the right size" do
              page["size"].should == count
            end 
          end
        end
      end
    end
  end
end

shared_examples_for "empty search" do
  it_behaves_like "search", 0
end

shared_context "with 10 saved assets" do
  let(:asset_uuids) {
    (0..9).map { |i| "11111111-2222-3333-4444-88888888888#{i}" }
  }
  let!(:asset_ids) do
    store.with_session do |session|
      (0..9).map do |i|
        new_asset = asset.call
        session << new_asset
        set_uuid(session, new_asset, asset_uuids[i])
        lambda { session.id_for(new_asset) }
      end
    end.map { |l| l.call }
  end
end

shared_context "creating label(s) for asset(s)" do
  let(:asset_type) { "resource" }
  let(:label_position) { "front barcode" }
  let(:label_type) { "sanger-barcode" }

  let(:labellable_uuids) {
    (0..9).map { |i| "22221111-2222-3333-4444-88888888888#{i}" }
  }
  let!(:labellable_ids) {
    store.with_session do |session|
      asset_uuids.zip(labellable_uuids) do |asset_uuid, labellable_uuid|
        session << labellable = Lims::Core::Laboratory::Labellable.new(:name => asset_uuid,
                                                           :type => asset_type)
        set_uuid(session, labellable, labellable_uuid)
        labellable[label_position] =
          Lims::Core::Laboratory::SangerBarcode.new({ :value => asset_uuid })
      end
    end
  }
end

shared_context "do the searching" do
  include_context "with 10 saved assets"
  include_context "creating label(s) for asset(s)"
  context "searching by their position" do
    let(:criteria) { { :label => { :position => label_position } } }
    it_behaves_like "search", 10
  end
  context "searching by their uuid (value) and type" do
    let(:criteria) { { :label => { :value => asset_uuids[0], :type => label_type } } }
    it_behaves_like "search", 1
  end
  context "searching by their uuid (value) and position" do
    let(:criteria) { { :label => { :value => asset_uuids[0], :position => label_position } } }
    it_behaves_like "search", 1
  end
end
