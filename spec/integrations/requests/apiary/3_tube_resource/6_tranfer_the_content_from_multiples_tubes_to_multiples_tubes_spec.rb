require "integrations/requests/apiary/3_tube_resource/spec_helper"
describe "tranfer_the_content_from_multiples_tubes_to_multiples_tubes" do
  include_context "use core context service"
  it "tranfer_the_content_from_multiples_tubes_to_multiples_tubes" do
  # **Transfer the content from multiple tubes to multiple tubes**. 
  # 
  # * `source_uuid` source tube uuid
  # * `target_uuid` target tube uuid
  # * `amount` amount taken from source tube and transfered in target tube
  # * `fraction` fraction (between 0 and 1) of each aliquot from source tube to be transfered in target tube (use amount **or** fraction)
  # * `aliquot_type` set a new type for all aliquots in the target tube
  # 
  # The example below shows how to make a tubes to tubes transfer in one action:
  # 
  # * from tube `11111111-2222-3333-4444-555555555555` to tube `11111111-2222-3333-4444-666666666666` 
  # * from tube `11111111-2222-3333-4444-777777777777` to tube `11111111-2222-3333-4444-888888888888`
  # 
  # **Note you can replace tube uuids with spin column uuids in order to make tubes to spin columns transfer
  # and spin columns to tubes transfer.**
    sample1 = Lims::Core::Laboratory::Sample.new(:name => 'sample 1')
    sample2 = Lims::Core::Laboratory::Sample.new(:name => 'sample 2')
    source_tube1 = Lims::Core::Laboratory::Tube.new << Lims::Core::Laboratory::Aliquot.new(:quantity => 10, :type => "RNA", :sample => sample1)
    source_tube2 = Lims::Core::Laboratory::Tube.new << Lims::Core::Laboratory::Aliquot.new(:quantity => 10, :type => "RNA", :sample => sample2)
    target_tube1 = Lims::Core::Laboratory::Tube.new
    target_tube2 = Lims::Core::Laboratory::Tube.new
    
    save_with_uuid sample1 => [1,2,3,0,0], sample2 => [1,2,3,0,1], source_tube1 => [1,2,3,4,5], source_tube2 => [1,2,3,4,7], target_tube1 => [1,2,3,4,6], target_tube2 => [1,2,3,4,8]

    header('Accept', 'application/json')
    header('Content-Type', 'application/json')

    response = post "/actions/transfer_tubes_to_tubes", "{ \"transfer_tubes_to_tubes\": { \n    \"transfers\": [\n        {\n            \"source_uuid\": \"11111111-2222-3333-4444-555555555555\", \n            \"target_uuid\": \"11111111-2222-3333-4444-666666666666\",\n            \"amount\": 5,\n            \"aliquot_type\": \"DNA\"\n        },\n        {\n            \"source_uuid\": \"11111111-2222-3333-4444-777777777777\", \n            \"target_uuid\": \"11111111-2222-3333-4444-888888888888\",\n            \"amount\": 5,\n            \"aliquot_type\": \"RNA\"\n        }\n    ]}\n}\n"
    response.status.should == 200
    response.body.should match_json "{ \"transfer_tubes_to_tubes\": {\n    \"actions\": {},\n    \"user\": \"user\",\n    \"application\": \"application\",\n    \"result\": {\n        \"sources\": [\n            { \"tube\": {\n                \"actions\": {\n                    \"read\": \"http://example.org/11111111-2222-3333-4444-555555555555\",\n                    \"create\": \"http://example.org/11111111-2222-3333-4444-555555555555\",\n                    \"update\": \"http://example.org/11111111-2222-3333-4444-555555555555\",\n                    \"delete\": \"http://example.org/11111111-2222-3333-4444-555555555555\"\n                },\n                \"uuid\": \"11111111-2222-3333-4444-555555555555\",\n                \"type\": null,\n                \"max_volume\": null,\n                \"aliquots\": [\n                    { \"sample\": {\n                        \"actions\": {\n                            \"read\": \"http://example.org/11111111-2222-3333-0000-000000000000\",\n                            \"create\": \"http://example.org/11111111-2222-3333-0000-000000000000\",\n                            \"update\": \"http://example.org/11111111-2222-3333-0000-000000000000\",\n                            \"delete\": \"http://example.org/11111111-2222-3333-0000-000000000000\"\n                        },\n                        \"uuid\": \"11111111-2222-3333-0000-000000000000\",\n                        \"name\": \"sample 1\"\n                    },\n                    \"quantity\": 10,\n                    \"type\": \"RNA\",\n                    \"unit\": \"mole\"\n                    }\n                ]\n            }},\n            { \"tube\": {\n                \"actions\": {\n                    \"read\": \"http://example.org/11111111-2222-3333-4444-777777777777\",\n                    \"create\": \"http://example.org/11111111-2222-3333-4444-777777777777\",\n                    \"update\": \"http://example.org/11111111-2222-3333-4444-777777777777\",\n                    \"delete\": \"http://example.org/11111111-2222-3333-4444-777777777777\"\n                },\n                \"uuid\": \"11111111-2222-3333-4444-777777777777\",\n                \"type\": null,\n                \"max_volume\": null,\n                \"aliquots\": [\n                    { \"sample\": {\n                        \"actions\": {\n                            \"read\": \"http://example.org/11111111-2222-3333-0000-111111111111\",\n                            \"create\": \"http://example.org/11111111-2222-3333-0000-111111111111\",\n                            \"update\": \"http://example.org/11111111-2222-3333-0000-111111111111\",\n                            \"delete\": \"http://example.org/11111111-2222-3333-0000-111111111111\"\n                        },\n                        \"uuid\": \"11111111-2222-3333-0000-111111111111\",\n                        \"name\": \"sample 2\"\n                    },\n                    \"quantity\": 10,\n                    \"type\": \"RNA\",\n                    \"unit\": \"mole\"\n                    }\n                ]\n            }}\n        ],\n        \"targets\": [\n            { \"tube\": {\n                \"actions\": {\n                    \"read\": \"http://example.org/11111111-2222-3333-4444-666666666666\",\n                    \"create\": \"http://example.org/11111111-2222-3333-4444-666666666666\",\n                    \"update\": \"http://example.org/11111111-2222-3333-4444-666666666666\",\n                    \"delete\": \"http://example.org/11111111-2222-3333-4444-666666666666\"\n                },\n                \"uuid\": \"11111111-2222-3333-4444-666666666666\",\n                \"type\": null,\n                \"max_volume\": null,\n                \"aliquots\": [\n                    { \"sample\": {\n                        \"actions\": {\n                            \"read\": \"http://example.org/11111111-2222-3333-0000-000000000000\",\n                            \"create\": \"http://example.org/11111111-2222-3333-0000-000000000000\",\n                            \"update\": \"http://example.org/11111111-2222-3333-0000-000000000000\",\n                            \"delete\": \"http://example.org/11111111-2222-3333-0000-000000000000\"\n                        },\n                        \"uuid\": \"11111111-2222-3333-0000-000000000000\",\n                        \"name\": \"sample 1\"\n                    },\n                    \"type\": \"DNA\",\n                    \"unit\": \"mole\"\n                    }\n                ]\n            }},   \n            { \"tube\": {\n                \"actions\": {\n                    \"read\": \"http://example.org/11111111-2222-3333-4444-888888888888\",\n                    \"create\": \"http://example.org/11111111-2222-3333-4444-888888888888\",\n                    \"update\": \"http://example.org/11111111-2222-3333-4444-888888888888\",\n                    \"delete\": \"http://example.org/11111111-2222-3333-4444-888888888888\"\n                },\n                \"uuid\": \"11111111-2222-3333-4444-888888888888\",\n                \"type\": null,\n                \"max_volume\": null,\n                \"aliquots\": [\n                    { \"sample\": {\n                        \"actions\": {\n                            \"read\": \"http://example.org/11111111-2222-3333-0000-111111111111\",\n                            \"create\": \"http://example.org/11111111-2222-3333-0000-111111111111\",\n                            \"update\": \"http://example.org/11111111-2222-3333-0000-111111111111\",\n                            \"delete\": \"http://example.org/11111111-2222-3333-0000-111111111111\"\n                        },\n                        \"uuid\": \"11111111-2222-3333-0000-111111111111\",\n                        \"name\": \"sample 2\"\n                    },\n                    \"type\": \"RNA\",\n                    \"unit\": \"mole\"\n                    }\n                ]\n            }}\n        ]\n    },\n    \"transfers\": [\n        {\n            \"source_uuid\": \"11111111-2222-3333-4444-555555555555\", \n            \"target_uuid\": \"11111111-2222-3333-4444-666666666666\",\n            \"amount\": 5,\n            \"aliquot_type\": \"DNA\"\n        },\n        {\n            \"source_uuid\": \"11111111-2222-3333-4444-777777777777\", \n            \"target_uuid\": \"11111111-2222-3333-4444-888888888888\",\n            \"amount\": 5,\n            \"aliquot_type\": \"RNA\"\n        }\n    ]\n}}\n"

  end
end
