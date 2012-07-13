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

describe Lims::Core::Laboratory::Plate do
  include_context "use core context service"
  include_context "JSON"
  let(:model) { "plates" }

  context "#create" do
    let(:dimension) { {:row_number => 8, :column_number => 12} }
    let(:parameters) { dimension }
    it "creates a new plate", :focus  => true   do
     puts post("/#{model}", parameters.to_json).body
     post("/#{model}", parameters.to_json).body.should == {}
    end
  end

  context "plate already exists" do
    let(:parameters) { {:row_number => 8, :column_number => 12} }
    let(:resource) do
      described_class.new(parameters).tap do |r|
      end
    end
    let!(:uuid) do
      store.with_session do |s|
        s << resource
        s.uuid_for(resource)
      end
    end


    context "empty" do
      context "read" do
        let (:expected_json) { { "plate" => parameters.merge(:read => uuid, :wells => []) }
        }
        it "outputs correct JSON" do
          get("/#{model}/#{uuid}").body.should  match_json(expected_json)
        end
      end
      context "update" do
        let (:expected_json) { { "plate" => "updated" } }
        it do
          put("/#{model}/#{uuid}", parameters ).body.should  match_json(expected_json)
        end
      end
      context "delete" do
        let (:expected_json) { { "plate" => "deleted" } }
        it do
          put("/#{model}/#{uuid}").body.should  match_json(expected_json)
        end
    # -----------------
    # Encoder 
    # -----------------

    def encoder_for(mime_types, url_generator)
      encoder_class_for(mime_types).andtap { |k| k.new(self, url_generator) }
    end


    # find first encoder available in {EncoderClassMap}.
    # @param [Array<String>] mime_types
    # @return [Class, nil]
    def encoder_class_for(mime_types)
      mime_types.each do |mime_type| 
        self.class.encoder_class_map[mime_type].andtap { |k| return k }
      end
      nil
    end


    # Map of Encoder classes by mime_type
    # @return [Hash<String, Class>]
    def self.encoder_class_map
      raise NotImplemtedError, "encoder_class_map"
    end
      end

    end
  end
end
