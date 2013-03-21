require "integrations/requests/apiary/4_tube_rack_resource/spec_helper"
describe "create_a_new_empty_tube_rack" do
  include_context "use core context service"
  it "create_a_new_empty_tube_rack" do
  # **Create a new empty tube rack.**
  # 
  # * `number_of_rows` number of rows in the rack
  # * `number_of_columns` number of columns in the rack
  # * `tubes` map tubes identified by their uuids to rack locations

    header('Accept', 'application/json')
    header('Content-Type', 'application/json')

    response = post "/tube_racks", "{ \"tube_rack\": {\n    \"number_of_rows\": 8,\n    \"number_of_columns\": 12,\n    \"tubes\": {}\n}}\n" 
    response.status.should == 200
    response.body.should match_json "{ \"tube_rack\": {\n    \"actions\": {\n        \"create\": \"http://example.org/11111111-2222-3333-4444-555555555555\",\n        \"read\": \"http://example.org/11111111-2222-3333-4444-555555555555\",\n        \"update\": \"http://example.org/11111111-2222-3333-4444-555555555555\",\n        \"delete\": \"http://example.org/11111111-2222-3333-4444-555555555555\"\n    },\n    \"uuid\": \"11111111-2222-3333-4444-555555555555\",\n    \"number_of_rows\": 8,\n    \"number_of_columns\": 12,\n    \"tubes\": {}\n}}\n"

  end
end
