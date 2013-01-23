require 'integrations/spec_helper'


require 'integrations/lab_resource_shared'

# model requirement

# To move in search_shared
#
#
shared_examples_for "search" do |count|
  context "#search" do
    let(:parameters) { {:search => { :description => description, :model => searched_model, :criteria => criteria}} }
    context "create" do
      let(:expected_json) do
        path = "http://example.org/#{uuid}"
        { "search" => {"actions" => {"read" => path,
              "first" => "#{path}/page=1",
              "last" => "#{path}/page=-1",
            },
            "uuid" => uuid,
          }
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
        let!(:answer) { JSON.parse(post("/#{model}", parameters.to_json).body)}
        let(:actions) { answer["search"]["actions"] }

        it "has actions"  do
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

#
# end to move in search_shared
#

shared_context "with 0 plate" do
  let(:plate_ids) do
    []
  end
end

shared_context "with 10 saved plates" do
  let(:plate_ids) do
    store.with_session do |session|
      (1..10).map do 
        session << plate= Lims::Core::Laboratory::Plate.new(dimensions)
        lambda { session.id_for(plate) }
      end
    end.map { |l| l.call }
  end
end

describe "Lims::Core::Persistence::Search"do
  include_context "use core context service", :aliquots, :wells, :plates, :samples, :searches
  include_context "JSON"
  let(:model) { "searches" }

  context "#plate" do
    let(:searched_model) { "plate" }
    let(:description) { "description" }
    include_context "has standard dimensions"
    context "with 0 plate" do
      let(:criteria) { { :id => [1,2,5,7,8] } }
      it_behaves_like ("empty search")
    end

    context "with some plates", :focus => true do
      include_context "with 10 saved plates"
      let(:criteria) { { :id => [1,2,5,7,8].map { |i| plate_ids[i] } }}
      #it_behaves_like ("search", {:count => 5})
      it_behaves_like "search", 5
    end

  end
end
