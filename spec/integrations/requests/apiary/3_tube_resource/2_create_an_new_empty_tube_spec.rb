require "integrations/requests/apiary/3_tube_resource/spec_helper"
describe "create_an_new_empty_tube", :tube => true do
  include_context "use core context service"
  it "create_an_new_empty_tube" do
  # **Create an new empty tube.**

    header('Accept', 'application/json')
    header('Content-Type', 'application/json')

    response = post "/tubes", "{ \"tube\": {}}\n"
    response.status.should == 200
    response.body.should match_json "{ \"tube\": {\n    \"actions\": {\n        \"read\": \"http://example.org/11111111-2222-3333-4444-555555555555\",\n        \"create\": \"http://example.org/11111111-2222-3333-4444-555555555555\",\n        \"update\": \"http://example.org/11111111-2222-3333-4444-555555555555\",\n        \"delete\": \"http://example.org/11111111-2222-3333-4444-555555555555\"\n    },\n    \"uuid\": \"11111111-2222-3333-4444-555555555555\",\n    \"type\": null,\n    \"max_volume\": null,\n    \"aliquots\": []\n}}                                                     \n"

  end
end
