require "integrations/requests/apiary/6_plate_resource/spec_helper"
describe "transfer_plates_to_plates_without_solvent" do
  include_context "use core context service"
  it "transfer_plates_to_plates_without_solvent" do
  # **Transfer plates to plates without solvent.**
  # 
  # This action transfers the given fraction of aliquot from plate-like asset(s)
  # to plate-like asset(s) and it changes the aliquot type to the given one.
  # A plate-like asset can be a plate, gel or a tube rack.
  # 
  # The action takes an array, which contains transfer elements.
  # 
  # * `source_uuid` uuid of the source plate
  # * `source_location` is the well/window/tube location (like "A1")
  # from transfer the aliquots
  # * `target_uuid` uuid of the target plate
  # * `target_location` is the well/window/tube location (like "A1")
  # to transfer the aliquots.
  # * `fractionmount` Amount is an amount of an aliquot to transfer.
  # Fraction is the fraction of an aliquot to transfer.
  # You should give the fraction OR the amount of the transfer, not both of them.
  # * `aliquot_type` set a new type for all aliquots in the target plate-like asset
    sample1 = Lims::Core::Laboratory::Sample.new(:name => 'sample for A1')
    source_plate1 = Lims::Core::Laboratory::Plate.new(:number_of_rows => 8,
                                    :number_of_columns => 12,
                                    :type => "source plate type")
    source_plate1["A1"] << Lims::Core::Laboratory::Aliquot.new(:quantity => 100, :type => "sample", :sample => sample1)
    
    sample2 = Lims::Core::Laboratory::Sample.new(:name => 'sample for C3')
    source_plate2 = Lims::Core::Laboratory::Plate.new(:number_of_rows => 8,
                                    :number_of_columns => 12,
                                    :type => "source plate type")
    source_plate2["C3"] << Lims::Core::Laboratory::Aliquot.new(:quantity => 100, :type => "sample", :sample => sample2)
    
    target_plate1 = Lims::Core::Laboratory::Plate.new(:number_of_rows => 8,
                                    :number_of_columns => 12,
                                    :type => "target plate type")
    target_plate2 = Lims::Core::Laboratory::Plate.new(:number_of_rows => 8,
                                    :number_of_columns => 12,
                                    :type => "target plate type")
    
    save_with_uuid sample1 => [1,2,3,4,5], sample2 => [1,2,3,4,6], source_plate1 => [1,2,3,1,0], source_plate2 => [1,2,3,1,1], target_plate1 => [1,2,3,1,2], target_plate2 => [1,2,3,1,3]

    header('Accept', 'application/json')
    header('Content-Type', 'application/json')

    response = post "/actions/transfer_plates_to_plates", "{ \"transfer_plates_to_plates\": {\n    \"transfers\": [\n        { \"source_uuid\": \"11111111-2222-3333-1111-000000000000\",\n          \"source_location\": \"A1\",\n          \"target_uuid\": \"11111111-2222-3333-1111-222222222222\",\n          \"target_location\": \"B2\",\n          \"fraction\": 0.4,\n          \"aliquot_type\": \"DNA\"\n        },\n        { \"source_uuid\": \"11111111-2222-3333-1111-111111111111\",\n          \"source_location\": \"C3\",\n          \"target_uuid\": \"11111111-2222-3333-1111-333333333333\",\n          \"target_location\": \"D4\",\n          \"fraction\": 0.4,\n          \"aliquot_type\": \"RNA\"\n        }\n    ]\n}}\n"
    response.status.should == 200
    response.body.should match_json "{ \"transfer_plates_to_plates\": {\n    \"actions\": {\n    },\n    \"user\": \"user\",\n    \"application\": \"application\",\n    \"result\": {\n        \"sources\": [ {\n            \"plate\": {\n                \"actions\": {\n                    \"read\": \"http://example.org/11111111-2222-3333-1111-000000000000\",\n                     \"create\": \"http://example.org/11111111-2222-3333-1111-000000000000\",\n                     \"update\": \"http://example.org/11111111-2222-3333-1111-000000000000\",\n                     \"delete\": \"http://example.org/11111111-2222-3333-1111-000000000000\"\n                },\n                \"uuid\": \"11111111-2222-3333-1111-000000000000\",\n                \"type\": \"source plate type\",\n                \"number_of_rows\": 8,\n                \"number_of_columns\": 12,\n                \"wells\": {\n                    \"A1\": [ {\n                        \"sample\": {\n                            \"actions\": {\n                                \"read\": \"http://example.org/11111111-2222-3333-4444-555555555555\",\n                                \"create\": \"http://example.org/11111111-2222-3333-4444-555555555555\",\n                                \"update\": \"http://example.org/11111111-2222-3333-4444-555555555555\",\n                                \"delete\": \"http://example.org/11111111-2222-3333-4444-555555555555\"\n                            },\n                            \"uuid\": \"11111111-2222-3333-4444-555555555555\",\n                            \"name\": \"sample for A1\"\n                        },\n                        \"quantity\": 100,\n                        \"type\": \"sample\",\n                        \"unit\": \"mole\"\n                    } ],\n                    \"A2\": [],\n                    \"A3\": [],\n                    \"A4\": [],\n                    \"A5\": [],\n                    \"A6\": [],\n                    \"A7\": [],\n                    \"A8\": [],\n                    \"A9\": [],\n                    \"A10\": [],\n                    \"A11\": [],\n                    \"A12\": [],\n                    \"B1\": [],\n                    \"B2\": [],\n                    \"B3\": [],\n                    \"B4\": [],\n                    \"B5\": [],\n                    \"B6\": [],\n                    \"B7\": [],\n                    \"B8\": [],\n                    \"B9\": [],\n                    \"B10\": [],\n                    \"B11\": [],\n                    \"B12\": [],\n                    \"C1\": [],\n                    \"C2\": [],\n                    \"C3\": [],\n                    \"C4\": [],\n                    \"C5\": [],\n                    \"C6\": [],\n                    \"C7\": [],\n                    \"C8\": [],\n                    \"C9\": [],\n                    \"C10\": [],\n                    \"C11\": [],\n                    \"C12\": [],\n                    \"D1\": [],\n                    \"D2\": [],\n                    \"D3\": [],\n                    \"D4\": [],\n                    \"D5\": [],\n                    \"D6\": [],\n                    \"D7\": [],\n                    \"D8\": [],\n                    \"D9\": [],\n                    \"D10\": [],\n                    \"D11\": [],\n                    \"D12\": [],\n                    \"E1\": [],\n                    \"E2\": [],\n                    \"E3\": [],\n                    \"E4\": [],\n                    \"E5\": [],\n                    \"E6\": [],\n                    \"E7\": [],\n                    \"E8\": [],\n                    \"E9\": [],\n                    \"E10\": [],\n                    \"E11\": [],\n                    \"E12\": [],\n                    \"F1\": [],\n                    \"F2\": [],\n                    \"F3\": [],\n                    \"F4\": [],\n                    \"F5\": [],\n                    \"F6\": [],\n                    \"F7\": [],\n                    \"F8\": [],\n                    \"F9\": [],\n                    \"F10\": [],\n                    \"F11\": [],\n                    \"F12\": [],\n                    \"G1\": [],\n                    \"G2\": [],\n                    \"G3\": [],\n                    \"G4\": [],\n                    \"G5\": [],\n                    \"G6\": [],\n                    \"G7\": [],\n                    \"G8\": [],\n                    \"G9\": [],\n                    \"G10\": [],\n                    \"G11\": [],\n                    \"G12\": [],\n                    \"H1\": [],\n                    \"H2\": [],\n                    \"H3\": [],\n                    \"H4\": [],\n                    \"H5\": [],\n                    \"H6\": [],\n                    \"H7\": [],\n                    \"H8\": [],\n                    \"H9\": [],\n                    \"H10\": [],\n                    \"H11\": [],\n                    \"H12\": []\n                }\n            }\n        },\n        {\n            \"plate\": {\n                \"actions\": {\n                    \"read\": \"http://example.org/11111111-2222-3333-1111-111111111111\",\n                    \"create\": \"http://example.org/11111111-2222-3333-1111-111111111111\",\n                    \"update\": \"http://example.org/11111111-2222-3333-1111-111111111111\",\n                    \"delete\": \"http://example.org/11111111-2222-3333-1111-111111111111\"\n                },\n                \"uuid\": \"11111111-2222-3333-1111-111111111111\",\n                \"type\": \"source plate type\",\n                \"number_of_rows\": 8,\n                \"number_of_columns\": 12,\n                \"wells\": {\n                    \"A1\": [],\n                    \"A2\": [],\n                    \"A3\": [],\n                    \"A4\": [],\n                    \"A5\": [],\n                    \"A6\": [],\n                    \"A7\": [],\n                    \"A8\": [],\n                    \"A9\": [],\n                    \"A10\": [],\n                    \"A11\": [],\n                    \"A12\": [],\n                    \"B1\": [],\n                    \"B2\": [],\n                    \"B3\": [],\n                    \"B4\": [],\n                    \"B5\": [],\n                    \"B6\": [],\n                    \"B7\": [],\n                    \"B8\": [],\n                    \"B9\": [],\n                    \"B10\": [],\n                    \"B11\": [],\n                    \"B12\": [],\n                    \"C1\": [],\n                    \"C2\": [],\n                    \"C3\": [ {\n                        \"sample\": {\n                            \"actions\": {\n                                \"read\": \"http://example.org/11111111-2222-3333-4444-666666666666\",\n                                \"create\": \"http://example.org/11111111-2222-3333-4444-666666666666\",\n                                \"update\": \"http://example.org/11111111-2222-3333-4444-666666666666\",\n                                \"delete\": \"http://example.org/11111111-2222-3333-4444-666666666666\"\n                            },\n                            \"uuid\": \"11111111-2222-3333-4444-666666666666\",\n                            \"name\": \"sample for C3\"\n                        },\n                        \"quantity\": 100,\n                        \"type\": \"sample\",\n                        \"unit\": \"mole\"\n                    } ],\n                    \"C4\": [],\n                    \"C5\": [],\n                    \"C6\": [],\n                    \"C7\": [],\n                    \"C8\": [],\n                    \"C9\": [],\n                    \"C10\": [],\n                    \"C11\": [],\n                    \"C12\": [],\n                    \"D1\": [],\n                    \"D2\": [],\n                    \"D3\": [],\n                    \"D4\": [],\n                    \"D5\": [],\n                    \"D6\": [],\n                    \"D7\": [],\n                    \"D8\": [],\n                    \"D9\": [],\n                    \"D10\": [],\n                    \"D11\": [],\n                    \"D12\": [],\n                    \"E1\": [],\n                    \"E2\": [],\n                    \"E3\": [],\n                    \"E4\": [],\n                    \"E5\": [],\n                    \"E6\": [],\n                    \"E7\": [],\n                    \"E8\": [],\n                    \"E9\": [],\n                    \"E10\": [],\n                    \"E11\": [],\n                    \"E12\": [],\n                    \"F1\": [],\n                    \"F2\": [],\n                    \"F3\": [],\n                    \"F4\": [],\n                    \"F5\": [],\n                    \"F6\": [],\n                    \"F7\": [],\n                    \"F8\": [],\n                    \"F9\": [],\n                    \"F10\": [],\n                    \"F11\": [],\n                    \"F12\": [],\n                    \"G1\": [],\n                    \"G2\": [],\n                    \"G3\": [],\n                    \"G4\": [],\n                    \"G5\": [],\n                    \"G6\": [],\n                    \"G7\": [],\n                    \"G8\": [],\n                    \"G9\": [],\n                    \"G10\": [],\n                    \"G11\": [],\n                    \"G12\": [],\n                    \"H1\": [],\n                    \"H2\": [],\n                    \"H3\": [],\n                    \"H4\": [],\n                    \"H5\": [],\n                    \"H6\": [],\n                    \"H7\": [],\n                    \"H8\": [],\n                    \"H9\": [],\n                    \"H10\": [],\n                    \"H11\": [],\n                    \"H12\": []\n                }\n            }\n        }],\n        \"targets\": [ {\n            \"plate\": {\n                \"actions\": {\n                    \"read\": \"http://example.org/11111111-2222-3333-1111-222222222222\",\n                    \"create\": \"http://example.org/11111111-2222-3333-1111-222222222222\",\n                    \"update\": \"http://example.org/11111111-2222-3333-1111-222222222222\",\n                    \"delete\": \"http://example.org/11111111-2222-3333-1111-222222222222\"\n                },\n                \"uuid\": \"11111111-2222-3333-1111-222222222222\",\n                \"type\": \"target plate type\",\n                \"number_of_rows\": 8,\n                \"number_of_columns\": 12,\n                \"wells\": {\n                    \"A1\": [],\n                    \"A2\": [],\n                    \"A3\": [],\n                    \"A4\": [],\n                    \"A5\": [],\n                    \"A6\": [],\n                    \"A7\": [],\n                    \"A8\": [],\n                    \"A9\": [],\n                    \"A10\": [],\n                    \"A11\": [],\n                    \"A12\": [],\n                    \"B1\": [],\n                    \"B2\": [ {\n                        \"sample\": {\n                            \"actions\": {\n                                \"read\": \"http://example.org/11111111-2222-3333-4444-555555555555\",\n                                \"create\": \"http://example.org/11111111-2222-3333-4444-555555555555\",\n                                \"update\": \"http://example.org/11111111-2222-3333-4444-555555555555\",\n                                \"delete\": \"http://example.org/11111111-2222-3333-4444-555555555555\"\n                            },\n                            \"uuid\": \"11111111-2222-3333-4444-555555555555\",\n                            \"name\": \"sample for A1\"\n                        },\n                        \"type\": \"DNA\",\n                        \"unit\": \"mole\"\n                    } ],\n                    \"B3\": [],\n                    \"B4\": [],\n                    \"B5\": [],\n                    \"B6\": [],\n                    \"B7\": [],\n                    \"B8\": [],\n                    \"B9\": [],\n                    \"B10\": [],\n                    \"B11\": [],\n                    \"B12\": [],\n                    \"C1\": [],\n                    \"C2\": [],\n                    \"C3\": [],\n                    \"C4\": [],\n                    \"C5\": [],\n                    \"C6\": [],\n                    \"C7\": [],\n                    \"C8\": [],\n                    \"C9\": [],\n                    \"C10\": [],\n                    \"C11\": [],\n                    \"C12\": [],\n                    \"D1\": [],\n                    \"D2\": [],\n                    \"D3\": [],\n                    \"D4\": [],\n                    \"D5\": [],\n                    \"D6\": [],\n                    \"D7\": [],\n                    \"D8\": [],\n                    \"D9\": [],\n                    \"D10\": [],\n                    \"D11\": [],\n                    \"D12\": [],\n                    \"E1\": [],\n                    \"E2\": [],\n                    \"E3\": [],\n                    \"E4\": [],\n                    \"E5\": [],\n                    \"E6\": [],\n                    \"E7\": [],\n                    \"E8\": [],\n                    \"E9\": [],\n                    \"E10\": [],\n                    \"E11\": [],\n                    \"E12\": [],\n                    \"F1\": [],\n                    \"F2\": [],\n                    \"F3\": [],\n                    \"F4\": [],\n                    \"F5\": [],\n                    \"F6\": [],\n                    \"F7\": [],\n                    \"F8\": [],\n                    \"F9\": [],\n                    \"F10\": [],\n                    \"F11\": [],\n                    \"F12\": [],\n                    \"G1\": [],\n                    \"G2\": [],\n                    \"G3\": [],\n                    \"G4\": [],\n                    \"G5\": [],\n                    \"G6\": [],\n                    \"G7\": [],\n                    \"G8\": [],\n                    \"G9\": [],\n                    \"G10\": [],\n                    \"G11\": [],\n                    \"G12\": [],\n                    \"H1\": [],\n                    \"H2\": [],\n                    \"H3\": [],\n                    \"H4\": [],\n                    \"H5\": [],\n                    \"H6\": [],\n                    \"H7\": [],\n                    \"H8\": [],\n                    \"H9\": [],\n                    \"H10\": [],\n                    \"H11\": [],\n                    \"H12\": []\n                }\n            }\n        },\n        {\n            \"plate\": {\n                \"actions\": {\n                    \"read\": \"http://example.org/11111111-2222-3333-1111-333333333333\",\n                    \"create\": \"http://example.org/11111111-2222-3333-1111-333333333333\",\n                    \"update\": \"http://example.org/11111111-2222-3333-1111-333333333333\",\n                    \"delete\": \"http://example.org/11111111-2222-3333-1111-333333333333\"\n                },\n                \"uuid\": \"11111111-2222-3333-1111-333333333333\",\n                \"type\": \"target plate type\",\n                \"number_of_rows\": 8,\n                \"number_of_columns\": 12,\n                \"wells\": {\n                    \"A1\": [],\n                    \"A2\": [],\n                    \"A3\": [],\n                    \"A4\": [],\n                    \"A5\": [],\n                    \"A6\": [],\n                    \"A7\": [],\n                    \"A8\": [],\n                    \"A9\": [],\n                    \"A10\": [],\n                    \"A11\": [],\n                    \"A12\": [],\n                    \"B1\": [],\n                    \"B2\": [],\n                    \"B3\": [],\n                    \"B4\": [],\n                    \"B5\": [],\n                    \"B6\": [],\n                    \"B7\": [],\n                    \"B8\": [],\n                    \"B9\": [],\n                    \"B10\": [],\n                    \"B11\": [],\n                    \"B12\": [],\n                    \"C1\": [],\n                    \"C2\": [],\n                    \"C3\": [],\n                    \"C4\": [],\n                    \"C5\": [],\n                    \"C6\": [],\n                    \"C7\": [],\n                    \"C8\": [],\n                    \"C9\": [],\n                    \"C10\": [],\n                    \"C11\": [],\n                    \"C12\": [],\n                    \"D1\": [],\n                    \"D2\": [],\n                    \"D3\": [],\n                    \"D4\": [ {\n                        \"sample\": {\n                            \"actions\": {\n                                \"read\": \"http://example.org/11111111-2222-3333-4444-666666666666\",\n                                \"create\": \"http://example.org/11111111-2222-3333-4444-666666666666\",\n                                \"update\": \"http://example.org/11111111-2222-3333-4444-666666666666\",\n                                \"delete\": \"http://example.org/11111111-2222-3333-4444-666666666666\"\n                            },\n                            \"uuid\": \"11111111-2222-3333-4444-666666666666\",\n                            \"name\": \"sample for C3\"\n                        },\n                        \"type\": \"RNA\",\n                        \"unit\": \"mole\"\n                    } ],\n                    \"D5\": [],\n                    \"D6\": [],\n                    \"D7\": [],\n                    \"D8\": [],\n                    \"D9\": [],\n                    \"D10\": [],\n                    \"D11\": [],\n                    \"D12\": [],\n                    \"E1\": [],\n                    \"E2\": [],\n                    \"E3\": [],\n                    \"E4\": [],\n                    \"E5\": [],\n                    \"E6\": [],\n                    \"E7\": [],\n                    \"E8\": [],\n                    \"E9\": [],\n                    \"E10\": [],\n                    \"E11\": [],\n                    \"E12\": [],\n                    \"F1\": [],\n                    \"F2\": [],\n                    \"F3\": [],\n                    \"F4\": [],\n                    \"F5\": [],\n                    \"F6\": [],\n                    \"F7\": [],\n                    \"F8\": [],\n                    \"F9\": [],\n                    \"F10\": [],\n                    \"F11\": [],\n                    \"F12\": [],\n                    \"G1\": [],\n                    \"G2\": [],\n                    \"G3\": [],\n                    \"G4\": [],\n                    \"G5\": [],\n                    \"G6\": [],\n                    \"G7\": [],\n                    \"G8\": [],\n                    \"G9\": [],\n                    \"G10\": [],\n                    \"G11\": [],\n                    \"G12\": [],\n                    \"H1\": [],\n                    \"H2\": [],\n                    \"H3\": [],\n                    \"H4\": [],\n                    \"H5\": [],\n                    \"H6\": [],\n                    \"H7\": [],\n                    \"H8\": [],\n                    \"H9\": [],\n                    \"H10\": [],\n                    \"H11\": [],\n                    \"H12\": []\n                }\n            }\n        }]\n    },\n    \"transfers\": [ {\n        \"source_uuid\": \"11111111-2222-3333-1111-000000000000\",\n        \"source_location\": \"A1\",\n        \"target_uuid\": \"11111111-2222-3333-1111-222222222222\",\n        \"target_location\": \"B2\",\n        \"fraction\": 0.4,\n        \"aliquot_type\": \"DNA\"\n        },\n        {\n        \"source_uuid\": \"11111111-2222-3333-1111-111111111111\",\n        \"source_location\": \"C3\",\n        \"target_uuid\": \"11111111-2222-3333-1111-333333333333\",\n        \"target_location\": \"D4\",\n        \"fraction\": 0.4,\n        \"aliquot_type\": \"RNA\"\n        }\n    ] }\n}\n"

  end
end
