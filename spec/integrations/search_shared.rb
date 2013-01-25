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

            its(:keys) { should == %w[actions size plates] }
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