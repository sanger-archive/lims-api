require "integrations/requests/apiary/6_plate_resource/spec_helper"
describe "transfer_plates_to_plates_without_solvent", :plate => true do
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

    response = post "/actions/transfer_plates_to_plates", <<-EOD
    {
    "transfer_plates_to_plates": {
        "transfers": [
            {
                "source_uuid": "11111111-2222-3333-1111-000000000000",
                "source_location": "A1",
                "target_uuid": "11111111-2222-3333-1111-222222222222",
                "target_location": "B2",
                "fraction": 0.4,
                "aliquot_type": "DNA"
            },
            {
                "source_uuid": "11111111-2222-3333-1111-111111111111",
                "source_location": "C3",
                "target_uuid": "11111111-2222-3333-1111-333333333333",
                "target_location": "D4",
                "fraction": 0.4,
                "aliquot_type": "RNA"
            }
        ]
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "transfer_plates_to_plates": {
        "actions": {
        },
        "user": "user",
        "application": "application",
        "result": {
            "sources": [
                {
                    "plate": {
                        "actions": {
                            "read": "http://example.org/11111111-2222-3333-1111-000000000000",
                            "create": "http://example.org/11111111-2222-3333-1111-000000000000",
                            "update": "http://example.org/11111111-2222-3333-1111-000000000000",
                            "delete": "http://example.org/11111111-2222-3333-1111-000000000000"
                        },
                        "uuid": "11111111-2222-3333-1111-000000000000",
                        "type": "source plate type",
                        "number_of_rows": 8,
                        "number_of_columns": 12,
                        "wells": {
                            "A1": [
                                {
                                    "sample": {
                                        "actions": {
                                            "read": "http://example.org/11111111-2222-3333-4444-555555555555",
                                            "create": "http://example.org/11111111-2222-3333-4444-555555555555",
                                            "update": "http://example.org/11111111-2222-3333-4444-555555555555",
                                            "delete": "http://example.org/11111111-2222-3333-4444-555555555555"
                                        },
                                        "uuid": "11111111-2222-3333-4444-555555555555",
                                        "name": "sample for A1"
                                    },
                                    "quantity": 100,
                                    "type": "sample",
                                    "unit": "mole"
                                }
                            ],
                            "A2": [

                            ],
                            "A3": [

                            ],
                            "A4": [

                            ],
                            "A5": [

                            ],
                            "A6": [

                            ],
                            "A7": [

                            ],
                            "A8": [

                            ],
                            "A9": [

                            ],
                            "A10": [

                            ],
                            "A11": [

                            ],
                            "A12": [

                            ],
                            "B1": [

                            ],
                            "B2": [

                            ],
                            "B3": [

                            ],
                            "B4": [

                            ],
                            "B5": [

                            ],
                            "B6": [

                            ],
                            "B7": [

                            ],
                            "B8": [

                            ],
                            "B9": [

                            ],
                            "B10": [

                            ],
                            "B11": [

                            ],
                            "B12": [

                            ],
                            "C1": [

                            ],
                            "C2": [

                            ],
                            "C3": [

                            ],
                            "C4": [

                            ],
                            "C5": [

                            ],
                            "C6": [

                            ],
                            "C7": [

                            ],
                            "C8": [

                            ],
                            "C9": [

                            ],
                            "C10": [

                            ],
                            "C11": [

                            ],
                            "C12": [

                            ],
                            "D1": [

                            ],
                            "D2": [

                            ],
                            "D3": [

                            ],
                            "D4": [

                            ],
                            "D5": [

                            ],
                            "D6": [

                            ],
                            "D7": [

                            ],
                            "D8": [

                            ],
                            "D9": [

                            ],
                            "D10": [

                            ],
                            "D11": [

                            ],
                            "D12": [

                            ],
                            "E1": [

                            ],
                            "E2": [

                            ],
                            "E3": [

                            ],
                            "E4": [

                            ],
                            "E5": [

                            ],
                            "E6": [

                            ],
                            "E7": [

                            ],
                            "E8": [

                            ],
                            "E9": [

                            ],
                            "E10": [

                            ],
                            "E11": [

                            ],
                            "E12": [

                            ],
                            "F1": [

                            ],
                            "F2": [

                            ],
                            "F3": [

                            ],
                            "F4": [

                            ],
                            "F5": [

                            ],
                            "F6": [

                            ],
                            "F7": [

                            ],
                            "F8": [

                            ],
                            "F9": [

                            ],
                            "F10": [

                            ],
                            "F11": [

                            ],
                            "F12": [

                            ],
                            "G1": [

                            ],
                            "G2": [

                            ],
                            "G3": [

                            ],
                            "G4": [

                            ],
                            "G5": [

                            ],
                            "G6": [

                            ],
                            "G7": [

                            ],
                            "G8": [

                            ],
                            "G9": [

                            ],
                            "G10": [

                            ],
                            "G11": [

                            ],
                            "G12": [

                            ],
                            "H1": [

                            ],
                            "H2": [

                            ],
                            "H3": [

                            ],
                            "H4": [

                            ],
                            "H5": [

                            ],
                            "H6": [

                            ],
                            "H7": [

                            ],
                            "H8": [

                            ],
                            "H9": [

                            ],
                            "H10": [

                            ],
                            "H11": [

                            ],
                            "H12": [

                            ]
                        }
                    }
                },
                {
                    "plate": {
                        "actions": {
                            "read": "http://example.org/11111111-2222-3333-1111-111111111111",
                            "create": "http://example.org/11111111-2222-3333-1111-111111111111",
                            "update": "http://example.org/11111111-2222-3333-1111-111111111111",
                            "delete": "http://example.org/11111111-2222-3333-1111-111111111111"
                        },
                        "uuid": "11111111-2222-3333-1111-111111111111",
                        "type": "source plate type",
                        "number_of_rows": 8,
                        "number_of_columns": 12,
                        "wells": {
                            "A1": [

                            ],
                            "A2": [

                            ],
                            "A3": [

                            ],
                            "A4": [

                            ],
                            "A5": [

                            ],
                            "A6": [

                            ],
                            "A7": [

                            ],
                            "A8": [

                            ],
                            "A9": [

                            ],
                            "A10": [

                            ],
                            "A11": [

                            ],
                            "A12": [

                            ],
                            "B1": [

                            ],
                            "B2": [

                            ],
                            "B3": [

                            ],
                            "B4": [

                            ],
                            "B5": [

                            ],
                            "B6": [

                            ],
                            "B7": [

                            ],
                            "B8": [

                            ],
                            "B9": [

                            ],
                            "B10": [

                            ],
                            "B11": [

                            ],
                            "B12": [

                            ],
                            "C1": [

                            ],
                            "C2": [

                            ],
                            "C3": [
                                {
                                    "sample": {
                                        "actions": {
                                            "read": "http://example.org/11111111-2222-3333-4444-666666666666",
                                            "create": "http://example.org/11111111-2222-3333-4444-666666666666",
                                            "update": "http://example.org/11111111-2222-3333-4444-666666666666",
                                            "delete": "http://example.org/11111111-2222-3333-4444-666666666666"
                                        },
                                        "uuid": "11111111-2222-3333-4444-666666666666",
                                        "name": "sample for C3"
                                    },
                                    "quantity": 100,
                                    "type": "sample",
                                    "unit": "mole"
                                }
                            ],
                            "C4": [

                            ],
                            "C5": [

                            ],
                            "C6": [

                            ],
                            "C7": [

                            ],
                            "C8": [

                            ],
                            "C9": [

                            ],
                            "C10": [

                            ],
                            "C11": [

                            ],
                            "C12": [

                            ],
                            "D1": [

                            ],
                            "D2": [

                            ],
                            "D3": [

                            ],
                            "D4": [

                            ],
                            "D5": [

                            ],
                            "D6": [

                            ],
                            "D7": [

                            ],
                            "D8": [

                            ],
                            "D9": [

                            ],
                            "D10": [

                            ],
                            "D11": [

                            ],
                            "D12": [

                            ],
                            "E1": [

                            ],
                            "E2": [

                            ],
                            "E3": [

                            ],
                            "E4": [

                            ],
                            "E5": [

                            ],
                            "E6": [

                            ],
                            "E7": [

                            ],
                            "E8": [

                            ],
                            "E9": [

                            ],
                            "E10": [

                            ],
                            "E11": [

                            ],
                            "E12": [

                            ],
                            "F1": [

                            ],
                            "F2": [

                            ],
                            "F3": [

                            ],
                            "F4": [

                            ],
                            "F5": [

                            ],
                            "F6": [

                            ],
                            "F7": [

                            ],
                            "F8": [

                            ],
                            "F9": [

                            ],
                            "F10": [

                            ],
                            "F11": [

                            ],
                            "F12": [

                            ],
                            "G1": [

                            ],
                            "G2": [

                            ],
                            "G3": [

                            ],
                            "G4": [

                            ],
                            "G5": [

                            ],
                            "G6": [

                            ],
                            "G7": [

                            ],
                            "G8": [

                            ],
                            "G9": [

                            ],
                            "G10": [

                            ],
                            "G11": [

                            ],
                            "G12": [

                            ],
                            "H1": [

                            ],
                            "H2": [

                            ],
                            "H3": [

                            ],
                            "H4": [

                            ],
                            "H5": [

                            ],
                            "H6": [

                            ],
                            "H7": [

                            ],
                            "H8": [

                            ],
                            "H9": [

                            ],
                            "H10": [

                            ],
                            "H11": [

                            ],
                            "H12": [

                            ]
                        }
                    }
                }
            ],
            "targets": [
                {
                    "plate": {
                        "actions": {
                            "read": "http://example.org/11111111-2222-3333-1111-222222222222",
                            "create": "http://example.org/11111111-2222-3333-1111-222222222222",
                            "update": "http://example.org/11111111-2222-3333-1111-222222222222",
                            "delete": "http://example.org/11111111-2222-3333-1111-222222222222"
                        },
                        "uuid": "11111111-2222-3333-1111-222222222222",
                        "type": "target plate type",
                        "number_of_rows": 8,
                        "number_of_columns": 12,
                        "wells": {
                            "A1": [

                            ],
                            "A2": [

                            ],
                            "A3": [

                            ],
                            "A4": [

                            ],
                            "A5": [

                            ],
                            "A6": [

                            ],
                            "A7": [

                            ],
                            "A8": [

                            ],
                            "A9": [

                            ],
                            "A10": [

                            ],
                            "A11": [

                            ],
                            "A12": [

                            ],
                            "B1": [

                            ],
                            "B2": [
                                {
                                    "sample": {
                                        "actions": {
                                            "read": "http://example.org/11111111-2222-3333-4444-555555555555",
                                            "create": "http://example.org/11111111-2222-3333-4444-555555555555",
                                            "update": "http://example.org/11111111-2222-3333-4444-555555555555",
                                            "delete": "http://example.org/11111111-2222-3333-4444-555555555555"
                                        },
                                        "uuid": "11111111-2222-3333-4444-555555555555",
                                        "name": "sample for A1"
                                    },
                                    "type": "DNA",
                                    "unit": "mole"
                                }
                            ],
                            "B3": [

                            ],
                            "B4": [

                            ],
                            "B5": [

                            ],
                            "B6": [

                            ],
                            "B7": [

                            ],
                            "B8": [

                            ],
                            "B9": [

                            ],
                            "B10": [

                            ],
                            "B11": [

                            ],
                            "B12": [

                            ],
                            "C1": [

                            ],
                            "C2": [

                            ],
                            "C3": [

                            ],
                            "C4": [

                            ],
                            "C5": [

                            ],
                            "C6": [

                            ],
                            "C7": [

                            ],
                            "C8": [

                            ],
                            "C9": [

                            ],
                            "C10": [

                            ],
                            "C11": [

                            ],
                            "C12": [

                            ],
                            "D1": [

                            ],
                            "D2": [

                            ],
                            "D3": [

                            ],
                            "D4": [

                            ],
                            "D5": [

                            ],
                            "D6": [

                            ],
                            "D7": [

                            ],
                            "D8": [

                            ],
                            "D9": [

                            ],
                            "D10": [

                            ],
                            "D11": [

                            ],
                            "D12": [

                            ],
                            "E1": [

                            ],
                            "E2": [

                            ],
                            "E3": [

                            ],
                            "E4": [

                            ],
                            "E5": [

                            ],
                            "E6": [

                            ],
                            "E7": [

                            ],
                            "E8": [

                            ],
                            "E9": [

                            ],
                            "E10": [

                            ],
                            "E11": [

                            ],
                            "E12": [

                            ],
                            "F1": [

                            ],
                            "F2": [

                            ],
                            "F3": [

                            ],
                            "F4": [

                            ],
                            "F5": [

                            ],
                            "F6": [

                            ],
                            "F7": [

                            ],
                            "F8": [

                            ],
                            "F9": [

                            ],
                            "F10": [

                            ],
                            "F11": [

                            ],
                            "F12": [

                            ],
                            "G1": [

                            ],
                            "G2": [

                            ],
                            "G3": [

                            ],
                            "G4": [

                            ],
                            "G5": [

                            ],
                            "G6": [

                            ],
                            "G7": [

                            ],
                            "G8": [

                            ],
                            "G9": [

                            ],
                            "G10": [

                            ],
                            "G11": [

                            ],
                            "G12": [

                            ],
                            "H1": [

                            ],
                            "H2": [

                            ],
                            "H3": [

                            ],
                            "H4": [

                            ],
                            "H5": [

                            ],
                            "H6": [

                            ],
                            "H7": [

                            ],
                            "H8": [

                            ],
                            "H9": [

                            ],
                            "H10": [

                            ],
                            "H11": [

                            ],
                            "H12": [

                            ]
                        }
                    }
                },
                {
                    "plate": {
                        "actions": {
                            "read": "http://example.org/11111111-2222-3333-1111-333333333333",
                            "create": "http://example.org/11111111-2222-3333-1111-333333333333",
                            "update": "http://example.org/11111111-2222-3333-1111-333333333333",
                            "delete": "http://example.org/11111111-2222-3333-1111-333333333333"
                        },
                        "uuid": "11111111-2222-3333-1111-333333333333",
                        "type": "target plate type",
                        "number_of_rows": 8,
                        "number_of_columns": 12,
                        "wells": {
                            "A1": [

                            ],
                            "A2": [

                            ],
                            "A3": [

                            ],
                            "A4": [

                            ],
                            "A5": [

                            ],
                            "A6": [

                            ],
                            "A7": [

                            ],
                            "A8": [

                            ],
                            "A9": [

                            ],
                            "A10": [

                            ],
                            "A11": [

                            ],
                            "A12": [

                            ],
                            "B1": [

                            ],
                            "B2": [

                            ],
                            "B3": [

                            ],
                            "B4": [

                            ],
                            "B5": [

                            ],
                            "B6": [

                            ],
                            "B7": [

                            ],
                            "B8": [

                            ],
                            "B9": [

                            ],
                            "B10": [

                            ],
                            "B11": [

                            ],
                            "B12": [

                            ],
                            "C1": [

                            ],
                            "C2": [

                            ],
                            "C3": [

                            ],
                            "C4": [

                            ],
                            "C5": [

                            ],
                            "C6": [

                            ],
                            "C7": [

                            ],
                            "C8": [

                            ],
                            "C9": [

                            ],
                            "C10": [

                            ],
                            "C11": [

                            ],
                            "C12": [

                            ],
                            "D1": [

                            ],
                            "D2": [

                            ],
                            "D3": [

                            ],
                            "D4": [
                                {
                                    "sample": {
                                        "actions": {
                                            "read": "http://example.org/11111111-2222-3333-4444-666666666666",
                                            "create": "http://example.org/11111111-2222-3333-4444-666666666666",
                                            "update": "http://example.org/11111111-2222-3333-4444-666666666666",
                                            "delete": "http://example.org/11111111-2222-3333-4444-666666666666"
                                        },
                                        "uuid": "11111111-2222-3333-4444-666666666666",
                                        "name": "sample for C3"
                                    },
                                    "type": "RNA",
                                    "unit": "mole"
                                }
                            ],
                            "D5": [

                            ],
                            "D6": [

                            ],
                            "D7": [

                            ],
                            "D8": [

                            ],
                            "D9": [

                            ],
                            "D10": [

                            ],
                            "D11": [

                            ],
                            "D12": [

                            ],
                            "E1": [

                            ],
                            "E2": [

                            ],
                            "E3": [

                            ],
                            "E4": [

                            ],
                            "E5": [

                            ],
                            "E6": [

                            ],
                            "E7": [

                            ],
                            "E8": [

                            ],
                            "E9": [

                            ],
                            "E10": [

                            ],
                            "E11": [

                            ],
                            "E12": [

                            ],
                            "F1": [

                            ],
                            "F2": [

                            ],
                            "F3": [

                            ],
                            "F4": [

                            ],
                            "F5": [

                            ],
                            "F6": [

                            ],
                            "F7": [

                            ],
                            "F8": [

                            ],
                            "F9": [

                            ],
                            "F10": [

                            ],
                            "F11": [

                            ],
                            "F12": [

                            ],
                            "G1": [

                            ],
                            "G2": [

                            ],
                            "G3": [

                            ],
                            "G4": [

                            ],
                            "G5": [

                            ],
                            "G6": [

                            ],
                            "G7": [

                            ],
                            "G8": [

                            ],
                            "G9": [

                            ],
                            "G10": [

                            ],
                            "G11": [

                            ],
                            "G12": [

                            ],
                            "H1": [

                            ],
                            "H2": [

                            ],
                            "H3": [

                            ],
                            "H4": [

                            ],
                            "H5": [

                            ],
                            "H6": [

                            ],
                            "H7": [

                            ],
                            "H8": [

                            ],
                            "H9": [

                            ],
                            "H10": [

                            ],
                            "H11": [

                            ],
                            "H12": [

                            ]
                        }
                    }
                }
            ]
        },
        "transfers": [
            {
                "source_uuid": "11111111-2222-3333-1111-000000000000",
                "source_location": "A1",
                "target_uuid": "11111111-2222-3333-1111-222222222222",
                "target_location": "B2",
                "fraction": 0.4,
                "aliquot_type": "DNA"
            },
            {
                "source_uuid": "11111111-2222-3333-1111-111111111111",
                "source_location": "C3",
                "target_uuid": "11111111-2222-3333-1111-333333333333",
                "target_location": "D4",
                "fraction": 0.4,
                "aliquot_type": "RNA"
            }
        ]
    }
}
    EOD

  end
end
