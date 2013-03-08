require "integrations/requests/apiary/8_order_resource/spec_helper"
describe "update_an_order" do
include_context "use core context service"
  # **Update an order.**
  # 
  # * `items` maps a role to a resource uuid and its update parameters. The item gets the status associated to its `event` parameter.
  # * `event` updates the order status.
  # * `pipeline` updates the pipeline parameter
  # * `study_uuid` updates the study parameter
  # * `creator_uuid` updates the creator parameter
  # * `cost_code` updates the cost_code parameter
  # * `parameters` updates the parameters attribute
  # * `state` updates the state parameter
  it "update_an_order" do
    study = Lims::Core::Organization::Study.new
    user = Lims::Core::Organization::User.new
    plate = Lims::Core::Laboratory::Plate.new(:number_of_rows => 8,
                                        :number_of_columns => 12,
                                        :type => "stock plate type")
    tube1 = Lims::Core::Laboratory::Tube.new
    tube_new = Lims::Core::Laboratory::Tube.new
    order = Lims::Core::Organization::Order.new(:creator => user, :study => study).tap { |o|
        o.add_source("Stock Plate 1", "11111111-2222-3333-4444-888888888888") #add plate to order as source
        o.add_target("Tube 1", "11111111-2222-3333-4444-999999999999") #add tube1 to order as target
    }
    
    save_with_uuid study => [1,2,3,4,7], user => [1,2,3,4,6], order => [1,2,3,4,5], plate => [1,2,3,4,8], tube1 => [1,2,3,4,9], tube_new => [1,0,0,0,1]

    header('Accept', 'application/json')
    header('Content-Type', 'application/json')

    response = put "/11111111-2222-3333-4444-555555555555", "{\n    \"items\": {\n        \"New Tube\": {\n            \"11111111-0000-0000-0000-111111111111\": { \"event\": \"start\" }\n        }\n    },\n    \"pipeline\": \"pipeline 2\",\n    \"study_uuid\": \"11111111-2222-3333-4444-777777777777\",\n    \"user_uuid\": \"11111111-2222-3333-4444-666666666666\",\n    \"cost_code\": \"cost code 2\",\n    \"parameters\": {\"param_1\": \"custom parameter\"},\n    \"state\": {\"state_1\": \"information about order state\"}\n}\n" 
    response.status.should == 200
    response.body.should match_json "{ \"order\": {\n    \"actions\": {\n        \"create\": \"http://example.org/11111111-2222-3333-4444-555555555555\",\n        \"read\": \"http://example.org/11111111-2222-3333-4444-555555555555\",\n        \"update\": \"http://example.org/11111111-2222-3333-4444-555555555555\",\n        \"delete\": \"http://example.org/11111111-2222-3333-4444-555555555555\"\n    },\n    \"uuid\": \"11111111-2222-3333-4444-555555555555\",\n    \"pipeline\": \"pipeline 2\",\n    \"status\": \"draft\",\n    \"parameters\": {\n        \"param_1\": \"custom parameter\"\n    },\n    \"state\": {\n        \"state_1\": \"information about order state\"\n    },\n    \"cost_code\": \"cost code 2\",\n    \"creator\": {\n        \"actions\": {\n                \"create\": \"http://example.org/11111111-2222-3333-4444-666666666666\",\n                \"read\": \"http://example.org/11111111-2222-3333-4444-666666666666\",\n                \"update\": \"http://example.org/11111111-2222-3333-4444-666666666666\",\n                \"delete\": \"http://example.org/11111111-2222-3333-4444-666666666666\"\n            },\n        \"uuid\": \"11111111-2222-3333-4444-666666666666\"\n    },\n    \"study\": {\n        \"actions\": {\n            \"create\": \"http://example.org/11111111-2222-3333-4444-777777777777\",\n            \"read\": \"http://example.org/11111111-2222-3333-4444-777777777777\",\n            \"update\": \"http://example.org/11111111-2222-3333-4444-777777777777\",\n            \"delete\": \"http://example.org/11111111-2222-3333-4444-777777777777\"\n        },\n        \"uuid\": \"11111111-2222-3333-4444-777777777777\"\n    },\n    \"items\": {\n        \"Stock Plate 1\": [\n            { \"uuid\": \"11111111-2222-3333-4444-888888888888\", \"status\": \"done\", \"batch\": null }\n        ],\n        \"Tube 1\": [\n            { \"uuid\": \"11111111-2222-3333-4444-999999999999\", \"status\": \"pending\", \"batch\": null }\n        ],\n        \"New Tube\": [\n            { \"uuid\": \"11111111-0000-0000-0000-111111111111\", \"status\": \"in_progress\", \"batch\": null }\n        ]\n    }\n} }\n"
  end
end
