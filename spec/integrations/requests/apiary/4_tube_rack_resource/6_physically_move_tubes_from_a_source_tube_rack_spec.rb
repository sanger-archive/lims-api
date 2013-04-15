require "integrations/requests/apiary/4_tube_rack_resource/spec_helper"
describe "physically_move_tubes_from_a_source_tube_rack", :tube_rack => true do
  include_context "use core context service"
  it "physically_move_tubes_from_a_source_tube_rack" do
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
    sample1 = Lims::Core::Laboratory::Sample.new(:name => 'sample 1')
    source_tube = Lims::Core::Laboratory::Tube.new << Lims::Core::Laboratory::Aliquot.new(:quantity => 10, :type => "sample", :sample => sample1)
    source_tube_rack = Lims::Core::Laboratory::TubeRack.new(:number_of_columns => 12, :number_of_rows => 8)
    target_tube_rack = Lims::Core::Laboratory::TubeRack.new(:number_of_columns => 12, :number_of_rows => 8)
    source_tube_rack["B5"] = source_tube
    
    save_with_uuid sample1 => [1,2,3,4,0], source_tube => [1,2,3,4,7], source_tube_rack => [1,2,3,4,5], target_tube_rack => [1,2,3,4,6]

    header('Accept', 'application/json')
    header('Content-Type', 'application/json')

    response = post "/actions/tube_rack_move", <<-EOD
    {
    "tube_rack_move": {
        "moves": [
            {
                "source_uuid": "11111111-2222-3333-4444-555555555555",
                "source_location": "B5",
                "target_uuid": "11111111-2222-3333-4444-666666666666",
                "target_location": "C3"
            }
        ]
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "tube_rack_move": {
        "actions": {
        },
        "user": "user",
        "application": "application",
        "result": [
            {
                "tube_rack": {
                    "actions": {
                        "read": "http://example.org/11111111-2222-3333-4444-666666666666",
                        "update": "http://example.org/11111111-2222-3333-4444-666666666666",
                        "delete": "http://example.org/11111111-2222-3333-4444-666666666666",
                        "create": "http://example.org/11111111-2222-3333-4444-666666666666"
                    },
                    "uuid": "11111111-2222-3333-4444-666666666666",
                    "number_of_rows": 8,
                    "number_of_columns": 12,
                    "tubes": {
                        "C3": {
                            "actions": {
                                "read": "http://example.org/11111111-2222-3333-4444-777777777777",
                                "create": "http://example.org/11111111-2222-3333-4444-777777777777",
                                "update": "http://example.org/11111111-2222-3333-4444-777777777777",
                                "delete": "http://example.org/11111111-2222-3333-4444-777777777777"
                            },
                            "uuid": "11111111-2222-3333-4444-777777777777",
                            "type": null,
                            "max_volume": null,
                            "aliquots": [
                                {
                                    "sample": {
                                        "actions": {
                                            "read": "http://example.org/11111111-2222-3333-4444-000000000000",
                                            "update": "http://example.org/11111111-2222-3333-4444-000000000000",
                                            "delete": "http://example.org/11111111-2222-3333-4444-000000000000",
                                            "create": "http://example.org/11111111-2222-3333-4444-000000000000"
                                        },
                                        "uuid": "11111111-2222-3333-4444-000000000000",
                                        "name": "sample 1"
                                    },
                                    "quantity": 10,
                                    "type": "sample",
                                    "unit": "mole"
                                }
                            ]
                        }
                    }
                }
            }
        ],
        "moves": [
            {
                "source_uuid": "11111111-2222-3333-4444-555555555555",
                "source_location": "B5",
                "target_uuid": "11111111-2222-3333-4444-666666666666",
                "target_location": "C3"
            }
        ]
    }
}
    EOD

  end
end
