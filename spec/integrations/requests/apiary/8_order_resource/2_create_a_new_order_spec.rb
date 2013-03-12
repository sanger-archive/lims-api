require "integrations/requests/apiary/8_order_resource/spec_helper"
describe "create_a_new_order" do
  include_context "use core context service"
  it "create_a_new_order" do
  # **Create a new order.**
  # 
  # * `study_uuid` uuid of an existing study
  # * `user_uuid` uuid of the order's creator
  # * `pipeline` pipeline name
  # * `cost_code` 
  # * `sources` map a role to an array of resource uuids. All the items in sources get a `done` status on order creation
  # * `targets` map a role to an array of resource uuids. All the items in targets get a `pending` status on order creation
    study = Lims::Core::Organization::Study.new
    user = Lims::Core::Organization::User.new
    plate = Lims::Core::Laboratory::Plate.new(:number_of_rows => 8,
                                        :number_of_columns => 12,
                                        :type => "stock plate type")
    tube1 = Lims::Core::Laboratory::Tube.new
    tube2 = Lims::Core::Laboratory::Tube.new
    
    save_with_uuid study => [1,2,3,4,7], user => [1,2,3,4,6], plate => [1,2,3,0,1], tube1 => [1,2,3,0,2], tube2 => [1,2,3,0,3]

    header('Accept', 'application/json')
    header('Content-Type', 'application/json')

    response = post "/orders", "{ \"order\": {\n    \"user_uuid\": \"11111111-2222-3333-4444-666666666666\",\n    \"study_uuid\": \"11111111-2222-3333-4444-777777777777\",\n    \"pipeline\": \"pipeline 1\",\n    \"cost_code\": \"cost code 1\",\n    \"sources\": {\n        \"Stock Plate 1\": [\"11111111-2222-3333-0000-111111111111\"]\n    },\n    \"targets\": {\n        \"Tube 1\": [\"11111111-2222-3333-0000-222222222222\", \"11111111-2222-3333-0000-333333333333\"]\n    }\n} }\n" 
    response.status.should == 200
    response.body.should match_json "{ \"order\": {\n    \"actions\": {\n        \"create\": \"http://example.org/11111111-2222-3333-4444-555555555555\",\n        \"read\": \"http://example.org/11111111-2222-3333-4444-555555555555\",\n        \"update\": \"http://example.org/11111111-2222-3333-4444-555555555555\",\n        \"delete\": \"http://example.org/11111111-2222-3333-4444-555555555555\"\n    },\n    \"uuid\": \"11111111-2222-3333-4444-555555555555\",\n    \"creator\": {\n        \"actions\": {\n                \"create\": \"http://example.org/11111111-2222-3333-4444-666666666666\",\n                \"read\": \"http://example.org/11111111-2222-3333-4444-666666666666\",\n                \"update\": \"http://example.org/11111111-2222-3333-4444-666666666666\",\n                \"delete\": \"http://example.org/11111111-2222-3333-4444-666666666666\"\n            },\n        \"uuid\": \"11111111-2222-3333-4444-666666666666\"\n    },\n    \"study\": {\n        \"actions\": {\n            \"create\": \"http://example.org/11111111-2222-3333-4444-777777777777\",\n            \"read\": \"http://example.org/11111111-2222-3333-4444-777777777777\",\n            \"update\": \"http://example.org/11111111-2222-3333-4444-777777777777\",\n            \"delete\": \"http://example.org/11111111-2222-3333-4444-777777777777\"\n        },\n        \"uuid\": \"11111111-2222-3333-4444-777777777777\"\n    },\n    \"pipeline\": \"pipeline 1\",\n    \"cost_code\": \"cost code 1\",\n    \"status\": \"draft\",\n    \"parameters\": {},\n    \"state\": {},\n    \"items\": {\n        \"Stock Plate 1\": [\n            { \"status\": \"done\", \"batch\": null, \"uuid\": \"11111111-2222-3333-0000-111111111111\" }\n        ],\n        \"Tube 1\": [\n            { \"status\": \"pending\", \"batch\": null, \"uuid\": \"11111111-2222-3333-0000-222222222222\" },\n            { \"status\": \"pending\", \"batch\": null, \"uuid\": \"11111111-2222-3333-0000-333333333333\" }\n        ]\n    }\n} }\n"

  end
end
