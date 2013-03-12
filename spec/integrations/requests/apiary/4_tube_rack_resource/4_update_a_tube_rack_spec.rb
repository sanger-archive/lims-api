require "integrations/requests/apiary/4_tube_rack_resource/spec_helper"
describe "update_a_tube_rack" do
  include_context "use core context service"
  it "update_a_tube_rack" do
  # **Update a tube rack.**
  # All aliquots in each tube of the tube rack will be updated with 
  # `aliquot_type` and `aliquot_quantity`.
  # 
  # * `aliquot_type`
  # * `aliquot_quantity` volume (ul) if liquid, mass (mg) if solid
    sample1 = Lims::Core::Laboratory::Sample.new(:name => 'sample 1')
    sample2 = Lims::Core::Laboratory::Sample.new(:name => 'sample 2')
    source_tube1 = Lims::Core::Laboratory::Tube.new << Lims::Core::Laboratory::Aliquot.new(:quantity => 5, :type => "NA", :sample => sample1)
    source_tube2 = Lims::Core::Laboratory::Tube.new << Lims::Core::Laboratory::Aliquot.new(:quantity => 5, :type => "NA", :sample => sample2)
    tube_rack = Lims::Core::Laboratory::TubeRack.new(:number_of_columns => 12, :number_of_rows => 8)
    tube_rack["A1"] = source_tube1
    tube_rack["E5"] = source_tube2
    
    save_with_uuid sample1 => [1,2,3,0,0], sample2 => [1,2,3,0,1], source_tube1 => [1,2,3,4,5], source_tube2 => [1,2,3,4,6], tube_rack => [1,2,3,4,7]

    header('Accept', 'application/json')
    header('Content-Type', 'application/json')

    response = put "/11111111-2222-3333-4444-777777777777", "{ \"aliquot_type\": \"DNA\", \"aliquot_quantity\": 10 }\n" 
    response.status.should == 200
    response.body.should match_json "{ \"tube_rack\": {\n    \"actions\": {\n        \"create\": \"http://example.org/11111111-2222-3333-4444-777777777777\",\n        \"read\": \"http://example.org/11111111-2222-3333-4444-777777777777\",\n        \"update\": \"http://example.org/11111111-2222-3333-4444-777777777777\",\n        \"delete\": \"http://example.org/11111111-2222-3333-4444-777777777777\"\n    },\n    \"uuid\": \"11111111-2222-3333-4444-777777777777\",\n    \"number_of_rows\": 8,\n    \"number_of_columns\": 12,\n    \"tubes\": {\n        \"A1\": {\n            \"actions\": {\n                \"create\": \"http://example.org/11111111-2222-3333-4444-555555555555\",\n                \"read\": \"http://example.org/11111111-2222-3333-4444-555555555555\",\n                \"update\": \"http://example.org/11111111-2222-3333-4444-555555555555\",\n                \"delete\": \"http://example.org/11111111-2222-3333-4444-555555555555\"\n            },\n            \"uuid\": \"11111111-2222-3333-4444-555555555555\",\n            \"type\": null,\n            \"max_volume\": null,\n            \"aliquots\": [\n                {\n                    \"sample\": {\n                        \"actions\": {\n                            \"read\": \"http://example.org/11111111-2222-3333-0000-000000000000\",\n                            \"create\": \"http://example.org/11111111-2222-3333-0000-000000000000\",\n                            \"update\": \"http://example.org/11111111-2222-3333-0000-000000000000\",\n                            \"delete\": \"http://example.org/11111111-2222-3333-0000-000000000000\"\n                        },\n                        \"uuid\": \"11111111-2222-3333-0000-000000000000\",\n                        \"name\": \"sample 1\"\n                    },\n                    \"quantity\": 10,\n                    \"type\": \"DNA\",\n                    \"unit\": \"mole\"\n                }\n            ]\n        },\n        \"E5\": {\n            \"actions\": {\n                \"read\": \"http://example.org/11111111-2222-3333-4444-666666666666\",\n                \"create\": \"http://example.org/11111111-2222-3333-4444-666666666666\",\n                \"update\": \"http://example.org/11111111-2222-3333-4444-666666666666\",\n                \"delete\": \"http://example.org/11111111-2222-3333-4444-666666666666\"\n            },\n            \"uuid\": \"11111111-2222-3333-4444-666666666666\",\n            \"type\": null,\n            \"max_volume\": null,\n            \"aliquots\": [\n                {\n                    \"sample\": {\n                        \"actions\": {\n                            \"read\": \"http://example.org/11111111-2222-3333-0000-111111111111\",\n                            \"create\": \"http://example.org/11111111-2222-3333-0000-111111111111\",\n                            \"update\": \"http://example.org/11111111-2222-3333-0000-111111111111\",\n                            \"delete\": \"http://example.org/11111111-2222-3333-0000-111111111111\"\n                        },\n                        \"uuid\": \"11111111-2222-3333-0000-111111111111\",\n                        \"name\": \"sample 2\"\n                    },\n                    \"quantity\": 10,\n                    \"type\": \"DNA\",\n                    \"unit\": \"mole\"\n                }\n            ]\n        }\n    }\n}}\n"

  end
end
