require 'spec_helper'

require 'lims-api/context_service'
require 'lims-core'
require 'lims-core/persistence/sequel'

def connect_db(env)
  config = YAML.load_file(File.join('config','database.yml'))
  Sequel.connect(config[env.to_s])
end

###################################################################################################
# SHARED CONTEXT FOR CONTEXT
###################################################################################################
shared_context 'use core context service' do
  let(:db) { connect_db(:test) }
  let(:store) { Lims::Core::Persistence::Sequel::Store.new(db) }
  let(:context_service) { Lims::Api::ContextService.new(store) }

  before(:each) do
    app.set(:context_service, context_service)
    db[:uuid_resources].delete
  end
end

shared_context 'JSON' do
  before(:each) {
    header('Accept', 'application/json')
    header('Content-Type', 'application/json')
  }
end

shared_context "expect empty plate" do
  # We don't use here Plate methods to generate the wells hash
  # because 
  let(:well_hash) {
    {}.tap do |h| 
    (1..row_number).each do |r|
      (1..column_number).each do |c|
        h["#{(?A.ord+r-1).chr}#{c}"]=[]
      end
    end
    end
  }

end

shared_context "expect plate JSON" do
  let (:expected_json) {
    path = "http://example.org/#{uuid}"
    { "plate" => {"actions" => {"read" => path,
      "update" => path,
      "delete" => path,
      "create" => path} ,
      "wells" => well_hash} }
  }
end

shared_context "use generated uuid" do 
  let! (:uuid) {
    '11111111-2222-3333-4444-555555555555'.tap do |uuid|
    Lims::Core::Uuids::UuidResource.stub(:generate_uuid).and_return(uuid)
    end
  }
end
shared_context "has dimension" do |row_number, column_number| 
  let(:row_number) { row_number }
  let(:column_number) { column_number }
  let(:dimension) { {:row_number => row_number, :column_number => column_number} }
end

shared_context "has standard dimension" do
  include_context("has dimension", 8, 12)
end

shared_examples_for "creating a plate" do
  include_context "use generated uuid"
  include_context "expect plate JSON"
  it "creates a new plate" do
    post("/#{model}", parameters.to_json).body.should match_json(expected_json)
  end

  it "reads the created plate" do
    post("/#{model}", parameters.to_json)
    get("/#{uuid}").body.should match_json(expected_json)
  end
end

shared_context "for empty plate" do
  let (:parameters) { dimension }
  include_context "expect empty plate"
end

shared_context "for plate with samples" do
  let (:parameters) {  dimension.merge(:wells_description => wells_description) }
  let(:sample) { Lims::Core::Laboratory::Sample.new("sample 1") }
  let(:sample_uuid) {  

    # We normally don't need it, and can use a generated one
    # but we do that here to override the stub use do set the plate uuid.
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

  let(:wells_description) { { "C5" => [{"sample_uuid" => sample_uuid }] } }
  let(:well_hash) {
    {}.tap do |h| 
    (1..row_number).each do |r|
      (1..column_number).each do |c|
        h["#{(?A.ord+r-1).chr}#{c}"]=[]
      end
    end
    end.merge(wells_description)
  }
end

describe Lims::Core::Laboratory::Plate do
  include_context "use core context service"
  include_context "JSON"
  let(:model) { "plates" }

  context "#create" do
    include_context "has standard dimension"
    context do
      include_context "for empty plate"
      it_behaves_like('creating a plate')
    end
    context do
      include_context "for plate with samples"
      it_behaves_like('creating a plate')
    end
  end

end
