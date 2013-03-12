require "integrations/requests/apiary/4_tube_rack_resource/spec_helper"
describe "create_a_new_tube_rack_and_add_it_multipe_tubes" do
include_context "use core context service"
  # **Create a new tube rack and add it multiple tubes.**
  # 
  # * `number_of_rows` number of rows in the rack
  # * `number_of_columns` number of columns in the rack
  # * `tubes` map tubes identified by their uuids to rack locations
  it "create_a_new_tube_rack_and_add_it_multipe_tubes" do
    sample1 = Lims::Core::Laboratory::Sample.new(:name => 'sample 1')
    sample2 = Lims::Core::Laboratory::Sample.new(:name => 'sample 2')
    tube1 = Lims::Core::Laboratory::Tube.new << Lims::Core::Laboratory::Aliquot.new(:quantity => 5, :type => "NA", :sample => sample1)
    tube2 = Lims::Core::Laboratory::Tube.new << Lims::Core::Laboratory::Aliquot.new(:quantity => 10, :type => "RNA", :sample => sample2)
    
    save_with_uuid sample1 => [1,2,3,0,0], sample2 => [1,2,3,0,1], tube1 => [1,2,3,4,1], tube2 => [1,2,3,4,2]
    set_uuid_start(1,2,3,4,7)

    header('Accept', 'application/json')
    header('Content-Type', 'application/json')

    response = post "/tube_racks", "{ \"tube_rack\": {\n    \"number_of_rows\": 8,\n    \"number_of_columns\": 12,\n    \"tubes\": {\n        \"A1\": \"11111111-2222-3333-4444-111111111111\",\n        \"E5\": \"11111111-2222-3333-4444-222222222222\"\n    }\n} }\n" 
    response.status.should == 200
    response.body.should match_json "{ \"tube_rack\": {\n    \"actions\": {\n        \"create\": \"http://example.org/11111111-2222-3333-4444-777777777777\",\n        \"read\": \"http://example.org/11111111-2222-3333-4444-777777777777\",\n        \"update\": \"http://example.org/11111111-2222-3333-4444-777777777777\",\n        \"delete\": \"http://example.org/11111111-2222-3333-4444-777777777777\"\n    },\n    \"uuid\": \"11111111-2222-3333-4444-777777777777\",\n    \"number_of_rows\": 8,\n    \"number_of_columns\": 12,\n    \"tubes\": {\n        \"A1\": {\n            \"actions\": {\n                \"create\": \"http://example.org/11111111-2222-3333-4444-111111111111\",\n                \"read\": \"http://example.org/11111111-2222-3333-4444-111111111111\",\n                \"update\": \"http://example.org/11111111-2222-3333-4444-111111111111\",\n                \"delete\": \"http://example.org/11111111-2222-3333-4444-111111111111\"\n            },\n            \"uuid\": \"11111111-2222-3333-4444-111111111111\",\n            \"type\": null,\n            \"max_volume\": null,\n            \"aliquots\": [\n                {\n                    \"sample\": {\n                        \"actions\": {\n                            \"read\": \"http://example.org/11111111-2222-3333-0000-000000000000\",\n                            \"create\": \"http://example.org/11111111-2222-3333-0000-000000000000\",\n                            \"update\": \"http://example.org/11111111-2222-3333-0000-000000000000\",\n                            \"delete\": \"http://example.org/11111111-2222-3333-0000-000000000000\"\n                        },\n                        \"uuid\": \"11111111-2222-3333-0000-000000000000\",\n                        \"name\": \"sample 1\"\n                    },\n                    \"quantity\": 5,\n                    \"type\": \"NA\",\n                    \"unit\": \"mole\"\n                }\n            ]\n        },\n        \"E5\": {\n            \"actions\": {\n                \"read\": \"http://example.org/11111111-2222-3333-4444-222222222222\",\n                \"create\": \"http://example.org/11111111-2222-3333-4444-222222222222\",\n                \"update\": \"http://example.org/11111111-2222-3333-4444-222222222222\",\n                \"delete\": \"http://example.org/11111111-2222-3333-4444-222222222222\"\n            },\n            \"uuid\": \"11111111-2222-3333-4444-222222222222\",\n            \"type\": null,\n            \"max_volume\": null,\n            \"aliquots\": [\n                {\n                    \"sample\": {\n                        \"actions\": {\n                            \"read\": \"http://example.org/11111111-2222-3333-0000-111111111111\",\n                            \"create\": \"http://example.org/11111111-2222-3333-0000-111111111111\",\n                            \"update\": \"http://example.org/11111111-2222-3333-0000-111111111111\",\n                            \"delete\": \"http://example.org/11111111-2222-3333-0000-111111111111\"\n                        },\n                        \"uuid\": \"11111111-2222-3333-0000-111111111111\",\n                        \"name\": \"sample 2\"\n                    },\n                    \"quantity\": 10,\n                    \"type\": \"RNA\",\n                    \"unit\": \"mole\"\n                }\n            ]\n        }\n    }\n}}\n"
  end
end
