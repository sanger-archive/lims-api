require "integrations/requests/apiary/8_order_resource/spec_helper"
describe "update_an_order", :order => true do
  include_context "use core context service"
  it "update_an_order" do
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

    response = put "/11111111-2222-3333-4444-555555555555", <<-EOD
    {
    "items": {
        "New Tube": {
            "11111111-0000-0000-0000-111111111111": {
                "event": "start"
            }
        }
    },
    "pipeline": "pipeline 2",
    "study_uuid": "11111111-2222-3333-4444-777777777777",
    "user_uuid": "11111111-2222-3333-4444-666666666666",
    "cost_code": "cost code 2",
    "parameters": {
        "param_1": "custom parameter"
    },
    "state": {
        "state_1": "information about order state"
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "create": "http://example.org/11111111-2222-3333-4444-555555555555",
            "read": "http://example.org/11111111-2222-3333-4444-555555555555",
            "update": "http://example.org/11111111-2222-3333-4444-555555555555",
            "delete": "http://example.org/11111111-2222-3333-4444-555555555555"
        },
        "uuid": "11111111-2222-3333-4444-555555555555",
        "pipeline": "pipeline 2",
        "status": "draft",
        "parameters": {
            "param_1": "custom parameter"
        },
        "state": {
            "state_1": "information about order state"
        },
        "cost_code": "cost code 2",
        "creator": {
            "actions": {
                "create": "http://example.org/11111111-2222-3333-4444-666666666666",
                "read": "http://example.org/11111111-2222-3333-4444-666666666666",
                "update": "http://example.org/11111111-2222-3333-4444-666666666666",
                "delete": "http://example.org/11111111-2222-3333-4444-666666666666"
            },
            "uuid": "11111111-2222-3333-4444-666666666666"
        },
        "study": {
            "actions": {
                "create": "http://example.org/11111111-2222-3333-4444-777777777777",
                "read": "http://example.org/11111111-2222-3333-4444-777777777777",
                "update": "http://example.org/11111111-2222-3333-4444-777777777777",
                "delete": "http://example.org/11111111-2222-3333-4444-777777777777"
            },
            "uuid": "11111111-2222-3333-4444-777777777777"
        },
        "items": {
            "Stock Plate 1": [
                {
                    "uuid": "11111111-2222-3333-4444-888888888888",
                    "status": "done",
                    "batch": null
                }
            ],
            "Tube 1": [
                {
                    "uuid": "11111111-2222-3333-4444-999999999999",
                    "status": "pending",
                    "batch": null
                }
            ],
            "New Tube": [
                {
                    "uuid": "11111111-0000-0000-0000-111111111111",
                    "status": "in_progress",
                    "batch": null
                }
            ]
        }
    }
}
    EOD

  end
end
