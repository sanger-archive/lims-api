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
  let(:labels) {
    Hash.new.tap do |asset|
      (0..9).each do |i|
        asset[i] = asset_uuids[i]
      end
    end
  }

  let(:labellable_uuids) {
    (0..9).map { |i| "22221111-2222-3333-4444-88888888888#{i}" }
  }
  let!(:labellable_ids) {
    store.with_session do |session|
      (0..9).map do |i|
        session << labellable = Lims::Core::Laboratory::Labellable.new(:name => asset_uuids[i],
                                                           :type => asset_type)
        set_uuid(session, labellable, labellable_uuids[i-1])
        labellable[label_position] =
          Lims::Core::Laboratory::SangerBarcode.new({ :value => labels[i] })
      end
    end
  }
end