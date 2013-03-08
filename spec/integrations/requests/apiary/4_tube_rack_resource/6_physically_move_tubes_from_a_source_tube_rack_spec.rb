require "integrations/requests/apiary/4_tube_rack_resource/spec_helper"
describe "physically_move_tubes_from_a_source_tube_rack" do
include_context "use core context service"
  # **Physically move tubes from source tube racks to target tube racks.**
  # It takes an array, which contains the elements of the movement.
  # An element has a source, source_location, target and target_location.
  # As it physically moves tubes, targeted locations mentioned in the movement elements need to be empty.
  # 
  # * `source_uuid` uuid of the source tube rack
  # * `source_location` the source tube location (like "A1") from move the source tube
  # * `target_uuid` uuid of the target tube rack
  # * `target_location` the target tube location (like "B1") to move the source tube
  # 
  # In the example below, the tube in B5 in the tube rack `11111111-2222-3333-4444-555555555555` is moved 
  # into the location C3 in the tube rack `11111111-2222-3333-4444-666666666666`.
  it "physically_move_tubes_from_a_source_tube_rack" do
    sample1 = Lims::Core::Laboratory::Sample.new(:name => 'sample 1')
    source_tube = Lims::Core::Laboratory::Tube.new << Lims::Core::Laboratory::Aliquot.new(:quantity => 10, :type => "sample", :sample => sample1)
    source_tube_rack = Lims::Core::Laboratory::TubeRack.new(:number_of_columns => 12, :number_of_rows => 8)
    target_tube_rack = Lims::Core::Laboratory::TubeRack.new(:number_of_columns => 12, :number_of_rows => 8)
    source_tube_rack["B5"] = source_tube
    
    save_with_uuid sample1 => [1,2,3,4,0], source_tube => [1,2,3,4,7], source_tube_rack => [1,2,3,4,5], target_tube_rack => [1,2,3,4,6]

    header('Accept', 'application/json')
    header('Content-Type', 'application/json')

    response = post "/actions/tube_rack_move", "{ \"tube_rack_move\": {\n    \"moves\": [\n        {\n            \"source_uuid\": \"11111111-2222-3333-4444-555555555555\",\n            \"source_location\": \"B5\",\n            \"target_uuid\": \"11111111-2222-3333-4444-666666666666\",\n            \"target_location\": \"C3\"\n        }\n    ]\n}}\n" 
    response.status.should == 200
    response.body.should match_json "{ \"tube_rack_move\": {\n    \"actions\": {},\n    \"user\": \"user\",\n    \"application\": \"application\",\n    \"result\": [\n        {\n        \"tube_rack\": {\n            \"actions\": {\n                \"read\": \"http://example.org/11111111-2222-3333-4444-666666666666\",\n                \"update\": \"http://example.org/11111111-2222-3333-4444-666666666666\",\n                \"delete\": \"http://example.org/11111111-2222-3333-4444-666666666666\",\n                \"create\": \"http://example.org/11111111-2222-3333-4444-666666666666\"\n            },\n            \"uuid\": \"11111111-2222-3333-4444-666666666666\",\n            \"number_of_rows\": 8,\n            \"number_of_columns\": 12,\n            \"tubes\": {\n                \"C3\": {\n                    \"actions\": {\n                        \"read\": \"http://example.org/11111111-2222-3333-4444-777777777777\",\n                        \"create\": \"http://example.org/11111111-2222-3333-4444-777777777777\",\n                        \"update\": \"http://example.org/11111111-2222-3333-4444-777777777777\",\n                        \"delete\": \"http://example.org/11111111-2222-3333-4444-777777777777\"\n                    },\n                    \"uuid\": \"11111111-2222-3333-4444-777777777777\",\n                    \"type\": null,\n                    \"max_volume\": null,\n                    \"aliquots\": [ \n                        {\"sample\": {\n                            \"actions\": {\n                                \"read\": \"http://example.org/11111111-2222-3333-4444-000000000000\",\n                                \"update\": \"http://example.org/11111111-2222-3333-4444-000000000000\",\n                                \"delete\": \"http://example.org/11111111-2222-3333-4444-000000000000\",\n                                \"create\": \"http://example.org/11111111-2222-3333-4444-000000000000\" \n                            },\n                            \"uuid\": \"11111111-2222-3333-4444-000000000000\",\n                            \"name\": \"sample 1\"\n                        },\n                        \"quantity\": 10,\n                        \"type\": \"sample\",\n                        \"unit\": \"mole\"\n                        } \n                    ]\n                }\n            }\n        }\n        }\n    ],\n    \"moves\": [\n        {\n            \"source_uuid\": \"11111111-2222-3333-4444-555555555555\",\n            \"source_location\": \"B5\",\n            \"target_uuid\": \"11111111-2222-3333-4444-666666666666\",\n            \"target_location\": \"C3\"\n        }\n    ]\n}}\n"
  end
end
