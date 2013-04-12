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
                "source_uuid": "11111111-2222-3333-4444-777777777777",
                "target_uuid": "11111111-2222-3333-4444-888888888888",
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
                                        "read": "http://example.org/11111111-2222-3333-0000-111111111111",
                                        "create": "http://example.org/11111111-2222-3333-0000-111111111111",
                                        "update": "http://example.org/11111111-2222-3333-0000-111111111111",
                                        "delete": "http://example.org/11111111-2222-3333-0000-111111111111"
                                    },
                                    "uuid": "11111111-2222-3333-0000-111111111111",
                                    "name": "sample 2"
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
                            "read": "http://example.org/11111111-2222-3333-4444-888888888888",
                            "create": "http://example.org/11111111-2222-3333-4444-888888888888",
                            "update": "http://example.org/11111111-2222-3333-4444-888888888888",
                            "delete": "http://example.org/11111111-2222-3333-4444-888888888888"
                        },
                        "uuid": "11111111-2222-3333-4444-888888888888",
                        "type": null,
                        "max_volume": null,
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/11111111-2222-3333-0000-111111111111",
                                        "create": "http://example.org/11111111-2222-3333-0000-111111111111",
                                        "update": "http://example.org/11111111-2222-3333-0000-111111111111",
                                        "delete": "http://example.org/11111111-2222-3333-0000-111111111111"
                                    },
                                    "uuid": "11111111-2222-3333-0000-111111111111",
                                    "name": "sample 2"
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
                "source_uuid": "11111111-2222-3333-4444-777777777777",
                "target_uuid": "11111111-2222-3333-4444-888888888888",
                "amount": 5,
                "aliquot_type": "RNA"
            }
        ]
    }
}
    EOD

  end
end
