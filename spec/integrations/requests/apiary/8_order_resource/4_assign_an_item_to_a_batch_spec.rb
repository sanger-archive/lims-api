require "integrations/requests/apiary/8_order_resource/spec_helper"
describe "assign_an_item_to_a_batch" do
include_context "use core context service"
  # **Assign an item to a batch**
  # 
  # This example can be combined with more complete order update using the above update example.
  # 
  # * `items` can take a `batch_uuid` attribute to assign an item to a batch
  # 
  # The example below update an order and assign the item `11111111-2222-3333-4444-666666666666` to the batch 
  # `11111111-2222-3333-4444-777777777777`. Note that an item can be assigned to a batch only through 
  # an update order action.
  it "assign_an_item_to_a_batch" do
    study = Lims::Core::Organization::Study.new
    user = Lims::Core::Organization::User.new
    order = Lims::Core::Organization::Order.new(:creator => user, :study => study, :pipeline => "P1", :cost_code => "cost code")
    tube = Lims::Core::Laboratory::Tube.new
    batch = Lims::Core::Organization::Batch.new(:process => "manual extraction")
    
    save_with_uuid study => [1,1,1,1,1], user => [1,1,1,1,0], order => [1,2,3,4,5], tube => [1,2,3,4,6], batch => [1,2,3,4,7]

    header('Accept', 'application/json')
    header('Content-Type', 'application/json')

    response = put "/11111111-2222-3333-4444-555555555555", "{ \"items\": {\n    \"role1\": {\n        \"11111111-2222-3333-4444-666666666666\": {\"batch_uuid\": \"11111111-2222-3333-4444-777777777777\"}\n    }\n} }\n" 
    response.status.should == 200
    response.body.should match_json "{\n   \"order\":{\n      \"actions\":{\n         \"read\":\"http://example.org/11111111-2222-3333-4444-555555555555\",\n         \"create\":\"http://example.org/11111111-2222-3333-4444-555555555555\",\n         \"update\":\"http://example.org/11111111-2222-3333-4444-555555555555\",\n         \"delete\":\"http://example.org/11111111-2222-3333-4444-555555555555\"\n      },\n      \"uuid\":\"11111111-2222-3333-4444-555555555555\",\n      \"pipeline\":\"P1\",\n      \"status\":\"draft\",\n      \"parameters\":{},\n      \"state\":{},\n      \"cost_code\":\"cost code\",\n      \"creator\":{\n         \"actions\":{\n            \"read\":\"http://example.org/11111111-1111-1111-1111-000000000000\",\n            \"create\":\"http://example.org/11111111-1111-1111-1111-000000000000\",\n            \"update\":\"http://example.org/11111111-1111-1111-1111-000000000000\",\n            \"delete\":\"http://example.org/11111111-1111-1111-1111-000000000000\"\n         },\n         \"uuid\":\"11111111-1111-1111-1111-000000000000\"\n      },\n      \"study\":{\n         \"actions\":{\n            \"read\":\"http://example.org/11111111-1111-1111-1111-111111111111\",\n            \"create\":\"http://example.org/11111111-1111-1111-1111-111111111111\",\n            \"update\":\"http://example.org/11111111-1111-1111-1111-111111111111\",\n            \"delete\":\"http://example.org/11111111-1111-1111-1111-111111111111\"\n         },\n         \"uuid\":\"11111111-1111-1111-1111-111111111111\"\n      },\n      \"items\":{\n         \"role1\":[\n            {\n               \"uuid\":\"11111111-2222-3333-4444-666666666666\",\n               \"status\":\"pending\",\n               \"batch\":{\n                  \"actions\":{\n                     \"read\":\"http://example.org/11111111-2222-3333-4444-777777777777\",\n                     \"create\":\"http://example.org/11111111-2222-3333-4444-777777777777\",\n                     \"update\":\"http://example.org/11111111-2222-3333-4444-777777777777\",\n                     \"delete\":\"http://example.org/11111111-2222-3333-4444-777777777777\"\n                  },\n                  \"uuid\":\"11111111-2222-3333-4444-777777777777\",\n                  \"process\":\"manual extraction\"\n               }\n            }\n         ]\n      }\n   }\n}\n"
  end
end
