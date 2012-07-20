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
describe Lims::Core::Laboratory::Plate do
  include_context "use core context service"
  include_context "JSON"
  let(:model) { "plates" }

  context "#create" do
    include_context "has standard dimension"
    let(:parameters) { dimension }
    include_context "use generated uuid"
    include_context "expect empty plate"
    include_context "expect plate JSON"

    it "creates a new plate" do
      post("/#{model}", parameters.to_json).body.should match_json(expected_json)
    end
  end

  context "plate already exists" do
    include_context "has standard dimension"
    let(:parameters) { dimension }
    let(:resource) do
      described_class.new(parameters).tap do |r|
      end
    end
    let!(:uuid) do
      store.with_session do |s|
        s << resource
        s.uuid_for!(resource)
      end
    end


    context "empty" do
      context "read" do
        include_context "expect empty plate"
        include_context "expect plate JSON"
        it "outputs correct JSON" do
          get("/#{uuid}").body.should  match_json(expected_json)
        end
      end
      pending "Which parameters do we send to update a plate" do
        context "update" do
          let (:expected_json) { { "plate" => "updated" } }
          it do
            put("/#{uuid}", parameters ).body.should  match_json(expected_json)
          end
        end
      end
      context "delete" do
        include_context "expect empty plate"
        include_context "expect plate JSON"
        it "returns the deleted object" do
          delete("/#{uuid}").body.should  match_json(expected_json)
        end
      end
    end
  end
end
