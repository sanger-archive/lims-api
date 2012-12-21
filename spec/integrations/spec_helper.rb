#shared contexts for integrations
require 'spec_helper'
require 'lims-api/context_service'
require 'lims-core'
require 'lims-core/persistence/sequel'

def connect_db(env)
  config = YAML.load_file(File.join('config','database.yml'))
  Sequel.connect(config[env.to_s])
end

def set_uuid(session, object, uuid)
  session << object
  ur = session.new_uuid_resource_for(object)
  ur.send(:uuid=, uuid)
end

shared_context 'use core context service' do |*tables|
  let(:db) { connect_db(:test) }
  let(:store) { Lims::Core::Persistence::Sequel::Store.new(db) }
  let(:message_bus) { mock(:message_bus).tap {|m| m.stub(:publish) { mock(:publish) }} }
  let(:context_service) { Lims::Api::ContextService.new(store, message_bus) }

  before(:each) do
    app.set(:context_service, context_service)
    db[:uuid_resources].delete
    tables.each { |table| db[table].delete }
  end
end

shared_context 'JSON' do
  before(:each) {
    header('Accept', 'application/json')
    header('Content-Type', 'application/json')
  }
end

shared_context "use generated uuid" do 
  let! (:uuid) {
    '11111111-2222-3333-4444-555555555555'.tap do |uuid|
    Lims::Core::Uuids::UuidResource.stub(:generate_uuid).and_return(uuid)
    end
  }
end

shared_context "a valid core action" do |&extra|
  it "creates something" do
    response = post(url, parameters.to_json)
    response.status.should == 200
    response.body.should match_json(expected_json)
    extra.call(response) if extra
  end
end

shared_context "an invalid core action" do |expected_status, &extra|
  it "doesn't create anything" do
    response = post(url, parameters.to_json)
    response.status.should  == expected_status
    response.body.should match_json(expected_json) if expected_json
    extra.call(response) if extra
  end
end
