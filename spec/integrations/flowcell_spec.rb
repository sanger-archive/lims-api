#flowcell_spec.rb
require 'spec_helper'

require 'lims-api/context_service'
require 'lims-core'
require 'lims-core/persistence/sequel'

require 'integrations/lab_resource_shared'
require 'integrations/spec_helper'

require 'lims-api/resource_shared'

def create_lane_array
  {}.tap do |flowcell| 
    (1..number_of_lanes).each do |i|
      flowcell[i.to_s]=[]
    end
  end
end

shared_context "expect empty flowcell" do
  let(:lane_array) { create_lane_array }
end

shared_context "expect flowcell JSON" do
  let (:expected_json) {
    path = "http://example.org/#{uuid}"
    { "flowcell" => {"actions" => {"read" => path,
          "update" => path,
          "delete" => path,
          "create" => path},
          "uuid" => uuid,
        "number_of_lanes" => number_of_lanes, 
        "lanes" => lane_array}
    }
  }
end

shared_context "for empty flowcell" do
  let (:parameters) { { :flowcell => number_of_lanes_hash} }
  include_context "expect empty flowcell"
end

shared_context "for flowcell with samples" do
  include_context "with filled aliquots"
  let(:aliquot_type) { 'sample' }
  let(:lanes_description) { { sample_position.to_s => [ { "sample_uuid"=> sample_uuid, "type" => aliquot_type } ] } }
  let(:lanes_description_response) { { sample_position.to_s => aliquot_array } }
  let (:parameters) { { :flowcell => number_of_lanes_hash.merge(:lanes_description => lanes_description) }}
  include_context "with saved sample"
  let(:lane_array) { create_lane_array.merge(lanes_description_response) }
end

shared_examples_for "with saved flowcell with samples" do
  subject { described_class.new(:number_of_lanes => 8) } 
  let (:sample_location) { 4 }
  include_context "with sample in location"
end

shared_context "has number of lane" do |nb_of_lanes|
  let(:number_of_lanes) { nb_of_lanes }
  let(:number_of_lanes_hash) { { :number_of_lanes => number_of_lanes } }
end
    
shared_context "miseq flowcell" do
  include_context("has number of lane", 1)
end
    
shared_context "hiseq flowcell" do
  include_context("has number of lane", 8)
end

shared_context "#create" do
  context do
    include_context "for empty flowcell"
    include_context "expect flowcell JSON"
    it_behaves_like('creating a resource') 
  end
  context do
    include_context "for flowcell with samples"
    include_context "expect flowcell JSON"
    it_behaves_like('creating a resource')
  end
end

describe Lims::Core::Laboratory::Flowcell do
  include_context "use core context service", :flowcells, :samples
  include_context "JSON"
  let(:model) { "flowcells" }

  context "of type Miseq with a sample in lane 1" do
    let(:sample_position) { 1 }
    include_context("miseq flowcell")
    include_context("#create")
  end

  context "of type Hiseq with a sample in lane 1" do
    let(:sample_position) { 1 }
    include_context("hiseq flowcell")
    include_context("#create")
  end
  
  context "of type Hiseq with a sample in lane 5" do
    let(:sample_position) { 5 }
    include_context("hiseq flowcell")
    include_context("#create")
  end

  context "#page" do
    context "with 1 flowcell" do
      let(:aliquot_type) { 'sample' }
      include_context "with filled aliquots"
      include_context "with saved flowcell with samples"
      it "display a page" do
        path = "http://example.org/#{uuid}"
        get("flowcells/page=1").body.should match_json({
            "actions" => {
              "read"=>"http://example.org/flowcells/page=1",
              "first"=>"http://example.org/flowcells/page=1",
              "last"=>"http://example.org/flowcells/page=-1"},
            "flowcells" => [
              {"flowcell" =>
                {"actions" => { "read" => path,
                  "update" => path,
                  "delete" => path,
                  "create" => path
                  },
                "uuid" => uuid,
                "number_of_lanes" => 8,
                "lanes" => {"1"=>[],"2"=>[],"3"=>[],"4"=>[],"5"=>aliquot_array,"6"=>[],"7"=>[],"8"=>[]}}}],
            "size"=>1
        })
      end
    end
    
    context do
      it "display an empty page" do
        #create a flowcell
        get("flowcells/page=1").body.should match_json({
          "actions"=>{
            "read"=>"http://example.org/flowcells/page=1",
            "first"=>"http://example.org/flowcells/page=1",
            "last"=>"http://example.org/flowcells/page=-1"},
          "flowcells"=>[],
          "size"=>0
        })
      end
    end
  end
end
