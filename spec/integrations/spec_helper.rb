#shared contexts for integrations
require 'spec_helper'
require 'lims-api/context_service'
require 'lims-api/message_bus'
require 'lims-core'
require 'lims-core/persistence/sequel'


require 'logger'
require 'yaml'
Loggers = []
#Loggers << Logger.new($stdout)

def connect_db(env)
  config = YAML.load_file(File.join('config','database.yml'))
  Sequel.connect(config[env.to_s], :loggers => Loggers)
end

def set_uuid(session, object, uuid)
  session << object
  ur = session.new_uuid_resource_for(object)
  ur.send(:uuid=, uuid)
end

def config_bus(env)
  YAML.load_file(File.join('config','amqp.yml'))[env.to_s] 
end

shared_context 'use core context service' do
  let(:db) { connect_db(:test) }
  let(:store) { Lims::Core::Persistence::Sequel::Store.new(db) }
  let(:message_bus) { mock(:message_bus).tap { |m| m.stub(:publish) } } 
  let(:context_service) { Lims::Api::ContextService.new(store, message_bus) }

  before(:each) do
    app.set(:context_service, context_service)
  end
  #This code is cleaning up the DB after each test case execution
  after(:each) do
    # list of all the tables in our DB
    %w{items orders batches searches labels labellables tube_aliquots spin_column_aliquots windows wells lanes tag_group_associations aliquots tube_rack_slots tube_racks tubes spin_columns gels plates flowcells samples oligos tag_groups studies users uuid_resources}.each do |table|
      db[table.to_sym].delete
    end
    db.disconnect
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
