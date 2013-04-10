require "integrations/requests/apiary/3_tube_resource/spec_helper"
describe "create_a_new_tube_with_samples", :tube => true do
  include_context "use core context service"
  it "create_a_new_tube_with_samples" do
  # **Create a new tube with samples.** It takes in parameters an array of aliquots, each aliquot is 
  # identified with the following attributes:
  # 
  # * `type` the actual type of the tube
  # * `max_volume` the max volume a tube can hold
  # * `sample_uuid` uuid of a sample
  # * `type` aliquot type
  # * `aliquot_quantity` volume (ul) if liquid, mass (mg) if solid
    save_with_uuid Lims::Core::Laboratory::Sample.new(:name => 'sample 1') => [1,2,3,4,6]

    header('Accept', 'application/json')
    header('Content-Type', 'application/json')

    response = post "/tubes", "{ \"tube\": { \n    \"type\": \"Eppendorf\",\n    \"max_volume\": 2,\n    \"aliquots\": [\n        { \"sample_uuid\": \"11111111-2222-3333-4444-666666666666\", \"type\": \"NA\", \"quantity\": 5 }\n    ] \n}}\n"
    response.status.should == 200
    response.body.should match_json "{ \"tube\": {\n    \"actions\": {\n        \"read\": \"http://example.org/11111111-2222-3333-4444-555555555555\",\n        \"create\": \"http://example.org/11111111-2222-3333-4444-555555555555\",\n        \"update\": \"http://example.org/11111111-2222-3333-4444-555555555555\",\n        \"delete\": \"http://example.org/11111111-2222-3333-4444-555555555555\"\n    },\n    \"uuid\": \"11111111-2222-3333-4444-555555555555\",\n    \"type\": \"Eppendorf\",\n    \"max_volume\": 2,\n    \"aliquots\": [\n        { \"sample\": {\n            \"actions\": {\n                \"read\": \"http://example.org/11111111-2222-3333-4444-666666666666\",\n                \"create\": \"http://example.org/11111111-2222-3333-4444-666666666666\",\n                \"update\": \"http://example.org/11111111-2222-3333-4444-666666666666\",\n                \"delete\": \"http://example.org/11111111-2222-3333-4444-666666666666\"\n            },\n            \"uuid\": \"11111111-2222-3333-4444-666666666666\",\n            \"name\": \"sample 1\"\n        },\n        \"quantity\": 5,\n        \"type\": \"NA\",\n        \"unit\": \"mole\"\n        }\n    ]\n}}\n"

  end
end
