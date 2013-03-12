require "integrations/requests/apiary/3_tube_resource/spec_helper"
describe "list_actions_for_a_tube_resource" do
  include_context "use core context service"
  it "list_actions_for_a_tube_resource" do
  # **List actions for a tube resource.**
  # 
  # * `create` creates a new tube via HTTP POST request
  # * `read` currently returns the list of actions for a tube resource via HTTP GET request
  # * `first` lists the first tube resources in a page browsing system
  # * `last` lists the last tube resources in a page browsing system

    header('Accept', 'application/json')
    header('Content-Type', 'application/json')

    response = get "/tubes", nil 
    response.status.should == 200
    response.body.should match_json "{ \"tubes\": {\n    \"actions\": {\n        \"create\": \"http://example.org/tubes\",\n        \"read\": \"http://example.org/tubes\",\n        \"first\": \"http://example.org/tubes/page=1\",\n        \"last\": \"http://example.org/tubes/page=-1\"\n    }\n} }\n"

  end
end
