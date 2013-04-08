require "integrations/requests/apiary/6_plate_resource/spec_helper"
describe "transfer_content_from_a_source_plate_to_a_target_plate" do
  include_context "use core context service"
  it "transfer_content_from_a_source_plate_to_a_target_plate" do
  # **Transfer content from a source plate to a target plate.**
  # 
  # * `source_uuid` uuid of the source plate
  # * `target_uuid` uuid of the target plate
  # * `transfer_map` map locations in the source plate to other locations in the target plate
  # * `aliquot_type` set a new type for all aliquots in the target plate
    sample1 = Lims::Core::Laboratory::Sample.new(:name => 'sample 1')
    plate1 = Lims::Core::Laboratory::Plate.new(:number_of_rows => 8,
                                    :number_of_columns => 12,
                                    :type => "source plate type")
    plate1["C5"] << Lims::Core::Laboratory::Aliquot.new(:quantity => 10, :type => "new type", :sample => sample1)
    plate2 = Lims::Core::Laboratory::Plate.new(:number_of_rows => 8,
                                    :number_of_columns => 12,
                                    :type => "target plate type")
    save_with_uuid sample1 => [1,2,3,4,7], plate1 => [1,2,3,4,5], plate2 => [1,2,3,4,6]

    header('Accept', 'application/json')
    header('Content-Type', 'application/json')

    response = post "/actions/plate_transfer", "{ \"plate_transfer\": {\n    \"source_uuid\": \"11111111-2222-3333-4444-555555555555\",\n    \"target_uuid\": \"11111111-2222-3333-4444-666666666666\",\n    \"transfer_map\": { \"C5\": \"B2\"},\n    \"aliquot_type\": \"new type\"\n}}\n"
    response.status.should == 200
    response.body.should match_json "{ \"plate_transfer\": {\n    \"actions\": {},\n    \"user\": \"user\",\n    \"application\": \"application\",\n    \"result\": {\n        \"plate\": {\n            \"actions\": {\n                \"read\": \"http://example.org/11111111-2222-3333-4444-666666666666\",\n                \"update\": \"http://example.org/11111111-2222-3333-4444-666666666666\",\n                \"delete\": \"http://example.org/11111111-2222-3333-4444-666666666666\",\n                \"create\": \"http://example.org/11111111-2222-3333-4444-666666666666\"\n            },\n            \"uuid\": \"11111111-2222-3333-4444-666666666666\",\n            \"number_of_rows\": 8,\n            \"number_of_columns\": 12,\n            \"type\": \"target plate type\",\n            \"wells\": {\n                \"A1\": [], \"A2\": [], \"A3\": [], \"A4\": [], \"A5\": [], \"A6\": [], \"A7\": [], \"A8\": [], \"A9\": [], \"A10\": [], \"A11\": [], \"A12\": [], \n                \"B1\": [], \n                \"B2\": [ { \n                    \"sample\": {\n                        \"actions\": { \n                            \"read\": \"http://example.org/11111111-2222-3333-4444-777777777777\",\n                            \"update\": \"http://example.org/11111111-2222-3333-4444-777777777777\",\n                            \"delete\": \"http://example.org/11111111-2222-3333-4444-777777777777\",\n                            \"create\": \"http://example.org/11111111-2222-3333-4444-777777777777\"\n                        },\n                    \"uuid\": \"11111111-2222-3333-4444-777777777777\",\n                    \"name\": \"sample 1\"},\n                    \"type\": \"new type\",\n                    \"unit\": \"mole\"\n                } ], \n                \"B3\": [], \"B4\": [], \"B5\": [], \"B6\": [], \"B7\": [], \"B8\": [], \"B9\": [], \"B10\": [], \"B11\": [], \"B12\": [], \n                \"C1\": [], \"C2\": [], \"C3\": [], \"C4\": [], \"C5\": [], \"C6\": [], \"C7\": [], \"C8\": [], \"C9\": [], \"C10\": [], \"C11\": [], \"C12\": [], \n                \"D1\": [], \"D2\": [], \"D3\": [], \"D4\": [], \"D5\": [], \"D6\": [], \"D7\": [], \"D8\": [], \"D9\": [], \"D10\": [], \"D11\": [], \"D12\": [], \n                \"E1\": [], \"E2\": [], \"E3\": [], \"E4\": [], \"E5\": [], \"E6\": [], \"E7\": [], \"E8\": [], \"E9\": [], \"E10\": [], \"E11\": [], \"E12\": [], \n                \"F1\": [], \"F2\": [], \"F3\": [], \"F4\": [], \"F5\": [], \"F6\": [], \"F7\": [], \"F8\": [], \"F9\": [], \"F10\": [], \"F11\": [], \"F12\": [], \n                \"G1\": [], \"G2\": [], \"G3\": [], \"G4\": [], \"G5\": [], \"G6\": [], \"G7\": [], \"G8\": [], \"G9\": [], \"G10\": [], \"G11\": [], \"G12\": [], \n                \"H1\": [], \"H2\": [], \"H3\": [], \"H4\": [], \"H5\": [], \"H6\": [], \"H7\": [], \"H8\": [], \"H9\": [], \"H10\": [], \"H11\": [], \"H12\": []\n            }    \n        }\n    },\n    \"source\": {\n        \"plate\": {\n            \"actions\": {\n                \"read\": \"http://example.org/11111111-2222-3333-4444-555555555555\",\n                \"update\": \"http://example.org/11111111-2222-3333-4444-555555555555\",\n                \"delete\": \"http://example.org/11111111-2222-3333-4444-555555555555\",\n                \"create\": \"http://example.org/11111111-2222-3333-4444-555555555555\"\n            },\n        \"uuid\": \"11111111-2222-3333-4444-555555555555\",\n        \"number_of_rows\": 8,\n        \"number_of_columns\": 12,\n        \"type\": \"source plate type\",\n        \"wells\": {\n                \"A1\": [], \"A2\": [], \"A3\": [], \"A4\": [], \"A5\": [], \"A6\": [], \"A7\": [], \"A8\": [], \"A9\": [], \"A10\": [], \"A11\": [], \"A12\": [], \n                \"B1\": [], \"B2\": [], \"B3\": [], \"B4\": [], \"B5\": [], \"B6\": [], \"B7\": [], \"B8\": [], \"B9\": [], \"B10\": [], \"B11\": [], \"B12\": [], \n                \"C1\": [], \"C2\": [], \"C3\": [], \"C4\": [], \n                \"C5\": [ { \n                    \"sample\": {\n                        \"actions\": { \n                            \"read\": \"http://example.org/11111111-2222-3333-4444-777777777777\",\n                            \"update\": \"http://example.org/11111111-2222-3333-4444-777777777777\",\n                            \"delete\": \"http://example.org/11111111-2222-3333-4444-777777777777\",\n                            \"create\": \"http://example.org/11111111-2222-3333-4444-777777777777\"\n                        },\n                    \"uuid\": \"11111111-2222-3333-4444-777777777777\",\n                    \"name\": \"sample 1\"},\n                    \"quantity\": 10,\n                    \"type\": \"new type\",\n                    \"unit\": \"mole\"\n                } ], \n                \"C6\": [], \"C7\": [], \"C8\": [], \"C9\": [], \"C10\": [], \"C11\": [], \"C12\": [], \n                \"D1\": [], \"D2\": [], \"D3\": [], \"D4\": [], \"D5\": [], \"D6\": [], \"D7\": [], \"D8\": [], \"D9\": [], \"D10\": [], \"D11\": [], \"D12\": [], \n                \"E1\": [], \"E2\": [], \"E3\": [], \"E4\": [], \"E5\": [], \"E6\": [], \"E7\": [], \"E8\": [], \"E9\": [], \"E10\": [], \"E11\": [], \"E12\": [], \n                \"F1\": [], \"F2\": [], \"F3\": [], \"F4\": [], \"F5\": [], \"F6\": [], \"F7\": [], \"F8\": [], \"F9\": [], \"F10\": [], \"F11\": [], \"F12\": [], \n                \"G1\": [], \"G2\": [], \"G3\": [], \"G4\": [], \"G5\": [], \"G6\": [], \"G7\": [], \"G8\": [], \"G9\": [], \"G10\": [], \"G11\": [], \"G12\": [], \n                \"H1\": [], \"H2\": [], \"H3\": [], \"H4\": [], \"H5\": [], \"H6\": [], \"H7\": [], \"H8\": [], \"H9\": [], \"H10\": [], \"H11\": [], \"H12\": []\n            }         \n        }\n    },\n    \"target\": {\n        \"plate\": {\n            \"actions\": {\n                \"read\": \"http://example.org/11111111-2222-3333-4444-666666666666\",\n                \"update\": \"http://example.org/11111111-2222-3333-4444-666666666666\",\n                \"delete\": \"http://example.org/11111111-2222-3333-4444-666666666666\",\n                \"create\": \"http://example.org/11111111-2222-3333-4444-666666666666\"\n            },\n        \"uuid\": \"11111111-2222-3333-4444-666666666666\",\n        \"number_of_rows\": 8,\n        \"number_of_columns\": 12,\n        \"type\": \"target plate type\",\n        \"wells\": {\n                \"A1\": [], \"A2\": [], \"A3\": [], \"A4\": [], \"A5\": [], \"A6\": [], \"A7\": [], \"A8\": [], \"A9\": [], \"A10\": [], \"A11\": [], \"A12\": [], \n                \"B1\": [], \n                \"B2\": [ { \n                    \"sample\": {\n                        \"actions\": { \n                            \"read\": \"http://example.org/11111111-2222-3333-4444-777777777777\",\n                            \"update\": \"http://example.org/11111111-2222-3333-4444-777777777777\",\n                            \"delete\": \"http://example.org/11111111-2222-3333-4444-777777777777\",\n                            \"create\": \"http://example.org/11111111-2222-3333-4444-777777777777\"\n                        },\n                    \"uuid\": \"11111111-2222-3333-4444-777777777777\",\n                    \"name\": \"sample 1\"},\n                    \"type\": \"new type\",\n                    \"unit\": \"mole\"\n                } ], \n                \"B3\": [], \"B4\": [], \"B5\": [], \"B6\": [], \"B7\": [], \"B8\": [], \"B9\": [], \"B10\": [], \"B11\": [], \"B12\": [], \n                \"C1\": [], \"C2\": [], \"C3\": [], \"C4\": [], \"C5\": [], \"C6\": [], \"C7\": [], \"C8\": [], \"C9\": [], \"C10\": [], \"C11\": [], \"C12\": [], \n                \"D1\": [], \"D2\": [], \"D3\": [], \"D4\": [], \"D5\": [], \"D6\": [], \"D7\": [], \"D8\": [], \"D9\": [], \"D10\": [], \"D11\": [], \"D12\": [], \n                \"E1\": [], \"E2\": [], \"E3\": [], \"E4\": [], \"E5\": [], \"E6\": [], \"E7\": [], \"E8\": [], \"E9\": [], \"E10\": [], \"E11\": [], \"E12\": [], \n                \"F1\": [], \"F2\": [], \"F3\": [], \"F4\": [], \"F5\": [], \"F6\": [], \"F7\": [], \"F8\": [], \"F9\": [], \"F10\": [], \"F11\": [], \"F12\": [], \n                \"G1\": [], \"G2\": [], \"G3\": [], \"G4\": [], \"G5\": [], \"G6\": [], \"G7\": [], \"G8\": [], \"G9\": [], \"G10\": [], \"G11\": [], \"G12\": [], \n                \"H1\": [], \"H2\": [], \"H3\": [], \"H4\": [], \"H5\": [], \"H6\": [], \"H7\": [], \"H8\": [], \"H9\": [], \"H10\": [], \"H11\": [], \"H12\": []\n            }\n        }\n    },\n    \"transfer_map\": { \"C5\": \"B2\" },\n    \"aliquot_type\": \"new type\"\n}}\n"

  end
end
