#tube_spec.rb
require 'spec_helper'

require 'lims-api/context_service'
require 'lims-core'
require 'lims-core/persistence/sequel'

require 'integrations/spec_helper'

def connect_db(env)
  config = YAML.load_file(File.join('config','database.yml'))
  Sequel.connect(config[env.to_s])
end

shared_examples_for "creating a tube" do
  include_context "use generated uuid"
 
  include_context "expect tube JSON"
  it "creates a new tube" do
    post("/#{model}", parameters.to_json).body.should match_json(expected_json)
  end
 
  it "reads the created tube" do
    post("/#{model}", parameters.to_json)
    get("/#{uuid}").body.should match_json(expected_json)
  end

end

shared_context "expect tube JSON" do
  let (:expected_json) {
    path = "http://example.org/#{uuid}"
    { "tube" => {"actions" => {"read" => path,
      "update" => path,
      "delete" => path,
      "create" => path},
      "aliquots" => aliquot_array }}
  }
end

shared_context "for empty tube" do
  let (:aliquot_array) { [ ]  } 
  let (:aliquots) {{:aliquots => aliquot_array }}
  let (:parameters) { aliquots }
end

shared_context "for tube with samples" do
  let (:sample) { Lims::Core::Laboratory::Sample.new("sample 1") }
  let (:sample_uuid) {  
    
    # We normally don't need it, and can use a generated one
    # but we do that here to override the stub use to set the tube uuid.
    '11111111-2222-3333-4444-888888888888'.tap do |uuid|
      store.with_session do |session|
        session << sample
        ur = session.new_uuid_resource_for(sample)
        ur.send(:uuid=, uuid)
      end
    end
  }
  let (:aliquot_array) { [ { "sample_uuid"=> sample_uuid } ]  } 
  let (:aliquots) {{:aliquots => aliquot_array }}
  let (:parameters) { aliquots }
end


describe Lims::Core::Laboratory::Tube do
  include_context "use core context service", :tubes, :samples
  include_context "JSON"
  let(:model) { "tubes" }


  context "#create" do
    context do
      include_context "for empty tube"
      it_behaves_like('creating a tube') 
    end
    context do
      include_context "for tube with samples"
      it_behaves_like('creating a tube')
    end
  end
end

