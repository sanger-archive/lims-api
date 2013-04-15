require "integrations/requests/apiary/3_tube_resource/spec_helper"
describe "transfer_the_content_from_one_tube_to_multiple_tubes", :tube => true do
  include_context "use core context service"
  it "transfer_the_content_from_one_tube_to_multiple_tubes" do
  # **Transfer the content from one tube to multiple tubes**.
  # 
  # * `source_uuid` source tube uuid
  # * `target_uuid` target tube uuid
  # * `amount` amount taken from source tube and transfered in target tube
  # * `fraction` fraction (between 0 and 1) of each aliquot from source tube to be transfered in target tube (use amount **or** fraction)
  # * `aliquot_type` set a new type for all aliquots in the target tube
  # 
  # The example below shows how to make a transfer from one tube to multiple tubes:
  # 
  # * from tube `11111111-2222-3333-4444-555555555555` to tube `11111111-2222-3333-4444-666666666666` 
  # and tube `11111111-2222-3333-4444-777777777777`
  # 
  # **Note you can replace tube uuids with spin column uuids in order to make a transfer from one tube to 
  # a target tube and a target spin columns**
    sample = Lims::Core::Laboratory::Sample.new(:name => 'sample 1')
    tube = Lims::Core::Laboratory::Tube.new << Lims::Core::Laboratory::Aliquot.new(:quantity => 10, :type => "RNA", :sample => sample)
    target = Lims::Core::Laboratory::Tube.new
    target2 = Lims::Core::Laboratory::Tube.new
    
    save_with_uuid sample => [1,2,3,0,0], tube => [1,2,3,4,5], target => [1,2,3,4,6], target2 => [1,2,3,4,7]

    header('Accept', 'application/json')
    header('Content-Type', 'application/json')

    response = post "/actions/transfer_tubes_to_tubes", <<-EOD
    {
    "transfer_tubes_to_tubes": {
        "transfers": [
            {
                "source_uuid": "11111111-2222-3333-4444-555555555555",
                "target_uuid": "11111111-2222-3333-4444-666666666666",
                "amount": 5,
                "aliquot_type": "DNA"
            },
            {
                "source_uuid": "11111111-2222-3333-4444-555555555555",
                "target_uuid": "11111111-2222-3333-4444-777777777777",
                "amount": 5,
                "aliquot_type": "RNA"
            }
        ]
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "transfer_tubes_to_tubes": {
        "actions": {
        },
        "user": "user",
        "application": "application",
        "result": {
            "sources": [
                {
                    "tube": {
                        "actions": {
                            "read": "http://example.org/11111111-2222-3333-4444-555555555555",
                            "create": "http://example.org/11111111-2222-3333-4444-555555555555",
                            "update": "http://example.org/11111111-2222-3333-4444-555555555555",
                            "delete": "http://example.org/11111111-2222-3333-4444-555555555555"
                        },
                        "uuid": "11111111-2222-3333-4444-555555555555",
                        "type": null,
                        "max_volume": null,
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/11111111-2222-3333-0000-000000000000",
                                        "create": "http://example.org/11111111-2222-3333-0000-000000000000",
                                        "update": "http://example.org/11111111-2222-3333-0000-000000000000",
                                        "delete": "http://example.org/11111111-2222-3333-0000-000000000000"
                                    },
                                    "uuid": "11111111-2222-3333-0000-000000000000",
                                    "name": "sample 1"
                                },
                                "quantity": 10,
                                "type": "RNA",
                                "unit": "mole"
                            }
                        ]
                    }
                }
            ],
            "targets": [
                {
                    "tube": {
                        "actions": {
                            "read": "http://example.org/11111111-2222-3333-4444-666666666666",
                            "create": "http://example.org/11111111-2222-3333-4444-666666666666",
                            "update": "http://example.org/11111111-2222-3333-4444-666666666666",
                            "delete": "http://example.org/11111111-2222-3333-4444-666666666666"
                        },
                        "uuid": "11111111-2222-3333-4444-666666666666",
                        "type": null,
                        "max_volume": null,
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/11111111-2222-3333-0000-000000000000",
                                        "create": "http://example.org/11111111-2222-3333-0000-000000000000",
                                        "update": "http://example.org/11111111-2222-3333-0000-000000000000",
                                        "delete": "http://example.org/11111111-2222-3333-0000-000000000000"
                                    },
                                    "uuid": "11111111-2222-3333-0000-000000000000",
                                    "name": "sample 1"
                                },
                                "type": "DNA",
                                "unit": "mole"
                            }
                        ]
                    }
                },
                {
                    "tube": {
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
                                        "read": "http://example.org/11111111-2222-3333-0000-000000000000",
                                        "create": "http://example.org/11111111-2222-3333-0000-000000000000",
                                        "update": "http://example.org/11111111-2222-3333-0000-000000000000",
                                        "delete": "http://example.org/11111111-2222-3333-0000-000000000000"
                                    },
                                    "uuid": "11111111-2222-3333-0000-000000000000",
                                    "name": "sample 1"
                                },
                                "type": "RNA",
                                "unit": "mole"
                            }
                        ]
                    }
                }
            ]
        },
        "transfers": [
            {
                "source_uuid": "11111111-2222-3333-4444-555555555555",
                "target_uuid": "11111111-2222-3333-4444-666666666666",
                "amount": 5,
                "aliquot_type": "DNA"
            },
            {
                "source_uuid": "11111111-2222-3333-4444-555555555555",
                "target_uuid": "11111111-2222-3333-4444-777777777777",
                "amount": 5,
                "aliquot_type": "RNA"
            }
        ]
    }
}
    EOD

  end
end
