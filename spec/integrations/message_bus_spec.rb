require 'rubygems'
require 'bunny'
require 'lims-core'
require 'integrations/spec_helper'


def order_expected_payload(args)
  action_url = "http://example.org/#{args[:uuid]}"
  user_url = "http://example.org/#{args[:user_uuid]}"
  study_url = "http://example.org/#{args[:study_uuid]}"

  {:order => {
    :actions => {:read => action_url, :create => action_url, :update => action_url, :delete => action_url},
    :uuid => args[:uuid], 
   :pipeline => args[:pipeline],
    :status => args[:status],
    :parameters => args[:parameters],
    :state => args[:state],
    :cost_code => args[:cost_code],
    :creator => {
      :actions => {:read => user_url, :create => user_url, :update => user_url, :delete => user_url},
      :uuid => args[:user_uuid] 
    },
    :study => {
      :actions => {:read => study_url, :create => study_url, :update => study_url, :delete => study_url},
      :uuid => args[:study_uuid] 
    },
    :items => args[:items]
  },
  :action => args[:action],
  :date => args[:date],
  :user => args[:user]} 
end


shared_examples_for "messages on the bus" do 
  before(:each) do
    Time.stub!(:now) do 
      mock(:time_now).tap do |t| 
        t.stub!(:utc).and_return("date")
      end
    end
  end

  it "publishes a message after order creation" do
    message_bus.should_receive(:publish).with(expected_create_payload, expected_create_settings) 
    post(create_url, parameters.to_json)
  end

  it "publishes messages after order creation and update" do
    message_bus.should_receive(:publish).with(expected_create_payload, expected_create_settings) 
    message_bus.should_receive(:publish).with(expected_update_payload, expected_update_settings) 
    post(create_url, parameters.to_json)
    put(update_url, update_parameters.to_json)
  end
end


describe "Message Bus" do
  include_context "use core context service"
  include_context "JSON"
  include_context "use generated uuid"

  let(:study_uuid) { "55555555-2222-3333-6666-777777777777".tap do |uuid|
    store.with_session do |session|
      study = Lims::Core::Organization::Study.new
      set_uuid(session, study, uuid)
    end
  end
  } 

  let(:user_uuid) { "66666666-2222-4444-9999-000000000000".tap do |uuid|
    store.with_session do |session|
      user = Lims::Core::Organization::User.new
      set_uuid(session, user, uuid)
    end
  end
  }
  let(:create_url) { "/orders" }
  let(:update_url) { "/#{uuid}" }     
  let(:create_action) { "create" }
  let(:update_action) { "update_order" }
  let(:order_items) { {
    :source_role1 => [{ "uuid" => "99999999-2222-4444-9999-000000000000", "status" => "done", "batch" => nil}],
    :target_role1 => [{ "uuid" => "99999999-2222-4444-9999-111111111111", "status" => "pending", "batch" => nil}] } 
  }
  let(:order_parameters) { {} }
  let(:order_state) { {} }
  let(:order_status) { "draft" }
  let(:order_cost_code) { "cost code" }
  let(:order_pipeline) { "pipeline" }
  let(:parameters) { {:order => {:user_uuid => user_uuid,
                                 :study_uuid => study_uuid,
                                 :sources => {:source_role1 => ["99999999-2222-4444-9999-000000000000"]},
                                 :targets => {:target_role1 => ["99999999-2222-4444-9999-111111111111"]},
                                 :cost_code => order_cost_code,
                                 :pipeline => order_pipeline}} }
  let(:update_parameters) { {:event => :build} }
  let(:payload_parameters) {{
    :uuid => uuid,
    :study_uuid => study_uuid,
    :user_uuid => user_uuid,
    :pipeline => order_pipeline,
    :status => order_status,
    :parameters => order_parameters,
    :state => order_state,
    :cost_code => order_cost_code,
    :items => order_items
  }}

  context "on valid order creation and update" do
    let(:date) { "date" }
    let(:user) { "user" }
    let(:expected_create_settings) { {:routing_key => "pipeline.66666666222244449999000000000000.order.create"} }
    let(:expected_update_settings) { {:routing_key => "pipeline.66666666222244449999000000000000.order.updateorder"} }
    let(:expected_create_payload) { order_expected_payload(payload_parameters.merge({
      :action => create_action,
      :date => date,
      :user => user
    })).to_json }
    let(:expected_update_payload) { order_expected_payload(payload_parameters.merge({
      :action => update_action, 
      :status => "pending",
      :date => date,
      :user => user
    })).to_json }
    it_behaves_like "messages on the bus"
  end
end
