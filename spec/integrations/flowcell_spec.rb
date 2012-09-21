#flowcell_spec.rb
require 'spec_helper'

require 'lims-api/context_service'
require 'lims-core'
require 'lims-core/persistence/sequel'

require 'integrations/spec_helper'

def connect_db(env)
  config = YAML.load_file(File.join('config','database.yml'))
  Sequel.connect(config[env.to_s])
end

shared_context "expect empty flowcell" do
  let(:lane_array) {
    {}.tap do |flowcell| 
      (1..number_of_lanes).each do |i|
        flowcell[i.to_s]=[]
      end
    end
  }
end

shared_context "expect flowcell JSON" do
  let (:expected_json) {
    path = "http://example.org/#{uuid}"
    { "flowcell" => {"actions" => {"read" => path,
      "update" => path,
      "delete" => path,
      "create" => path},
      "number_of_lanes" => number_of_lanes, 
      "lanes" => lane_array} }
  }
end

shared_examples_for "creating a flowcell" do
  include_context "use generated uuid"
  include_context "expect flowcell JSON"
  it "creates a new flowcell" do
    post("/#{model}", parameters.to_json).body.should match_json(expected_json)
  end
 
  it "reads the created flowcell" do
    post("/#{model}", parameters.to_json)
    get("/#{uuid}").body.should match_json(expected_json)
  end
end

shared_context "for empty flowcell" do
  let (:parameters) { number_of_lanes_hash }  
  include_context "expect empty flowcell"
end

shared_context "for flowcell with samples" do
  let(:lanes_description) { { sample_position.to_s => [{"sample_uuid" => sample_uuid }] } }
  let (:parameters) { number_of_lanes_hash.merge(:lanes_description => lanes_description) }
  let (:sample) { Lims::Core::Laboratory::Sample.new("sample 1") }
  let (:sample_uuid) {  
    
    # We normally don't need it, and can use a generated one
    # but we do that here to override the stub use do set the flowcell uuid.
    '11111111-2222-3333-4444-888888888888'.tap do |uuid|
      #Lims::Core::Uuids::UuidResource.stub(:generate_uuid).and_return(uuid)
      #save sample with uuid
      store.with_session do |session|
        session << sample
        ur = session.new_uuid_resource_for(sample)
        ur.send(:uuid=, uuid)
      end
    end
  }

  let(:lane_array) {
    {}.tap do |flowcell| 
      (1..number_of_lanes).each do |i|
        flowcell[i.to_s]=[]
      end
    end.merge(lanes_description)
  }
end

shared_examples_for "with saved flowcell with samples" do
  subject { described_class.new(:number_of_lanes => 8) } 
  include_context "with saved sample"
  let!(:uuid) {
    "11111111-2222-3333-4444-555555555555".tap do |uuid|
      #save the flowcell
      sample_uuid
      store.with_session do |session|
        subject[4] << Lims::Core::Laboratory::Aliquot.new(:sample => session[sample_uuid])
        session << subject
        set_uuid(session, subject, uuid)
      end
    end
  }
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
    it_behaves_like('creating a flowcell') 
  end
  context do
    include_context "for flowcell with samples"
    it_behaves_like('creating a flowcell')
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
      include_context "with saved flowcell with samples"
      it "display a page" do
        path = "http://example.org/#{uuid}"
        get("flowcells/page=1").body.should match_json({
          "flowcells" => {
            "actions" => {
              "read"=>"http://example.org/flowcells/page=1"},
            "flowcells" => [
              {"flowcell" =>
                {"actions" => { "read" => path,
                  "update" => path,
                  "delete" => path,
                  "create" => path
                  },
                "number_of_lanes" => 8,
                "lanes" => {"1"=>[],"2"=>[],"3"=>[],"4"=>[],"5"=>[{"sample_uuid"=>sample_uuid}],"6"=>[],"7"=>[],"8"=>[]}}}]}})
      end
    end
    
    context do
      it "display an empty page" do
        #create a flowcell
        get("flowcells/page=1").body.should match_json({
          "flowcells"=> {
          "actions"=>{
          "read"=>"http://example.org/flowcells/page=1"},
          "flowcells"=>[]}})
      end
    end
  end
end
