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
      # TODO replace the magic number to a parameter (number_of_lanes)
      (0..7).each do |i|
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
      "create" => path} ,
      "lanes" => lane_array} }
  }
end

shared_examples_for "creating a flowcell" do
  include_context "use generated uuid"
  include_context "expect flowcell JSON"
  it "creates a new flowcell" do
    post("/#{model}", parameter.to_json).body.should match_json(expected_json)
  end

  it "reads the created flowcell" do
    post("/#{model}", parameter.to_json)
    get("/#{uuid}").body.should match_json(expected_json)
  end
end

shared_context "for empty flowcell" do
  let (:parameter) { {} } 
  # TODO add a number_of_lanes parameter  
  include_context "expect empty flowcell"
end

shared_context "for flowcell with samples" do
  let (:parameter) {  { :lanes_description => lanes_description} }
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

  let(:lanes_description) { { "5" => [{"sample_uuid" => sample_uuid }] } }
  let(:lane_array) {
    {}.tap do |flowcell| 
      # TODO replace the magic number to a parameter (number_of_lanes)
      (0..7).each do |i|
        flowcell[i.to_s]=[]
      end
    end.merge(lanes_description)
  }
end

describe Lims::Core::Laboratory::Flowcell do
  include_context "use core context service"
  include_context "JSON"
  let(:model) { "flowcells" }

  context "#create" do
    context do
      include_context "for empty flowcell"
      it_behaves_like('creating a flowcell')
    end
    context do
      include_context "for flowcell with samples"
     it_behaves_like('creating a flowcell')
    end
  end
end
