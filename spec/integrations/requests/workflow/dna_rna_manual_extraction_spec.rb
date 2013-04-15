require "integrations/requests/workflow/spec_helper"
describe "dna_rna_manual_extraction" do
  include_context "use core context service"
  include_context 'setup_s2_environment_for_dna_rna_manual_extraction'
  it "dna_rna_manual_extraction" do
    push_uuids(["349460b0-7f57-0130-e345-282066132de2", "349969d0-7f57-0130-e345-282066132de2", "349e3760-7f57-0130-e345-282066132de2", "34a52320-7f57-0130-e345-282066132de2", "35237a40-7f57-0130-e345-282066132de2", "355d01d0-7f57-0130-e345-282066132de2", "35f1f2c0-7f57-0130-e345-282066132de2", "362fbaa0-7f57-0130-e345-282066132de2", "36437e60-7f57-0130-e345-282066132de2", "365fd5b0-7f57-0130-e345-282066132de2", "36761180-7f57-0130-e345-282066132de2", "368d90c0-7f57-0130-e345-282066132de2", "36a3d7a0-7f57-0130-e345-282066132de2", "36bb5bd0-7f57-0130-e345-282066132de2", "36cfea70-7f57-0130-e345-282066132de2", "3bb68680-7f57-0130-e345-282066132de2", "3bc66470-7f57-0130-e345-282066132de2", "3be83770-7f57-0130-e345-282066132de2", "3bf17180-7f57-0130-e345-282066132de2", "37669990-7f57-0130-e345-282066132de2", "37795ee0-7f57-0130-e345-282066132de2", "37a563a0-7f57-0130-e345-282066132de2", "37b7e9e0-7f57-0130-e345-282066132de2", "3c744720-7f57-0130-e345-282066132de2", "3c899370-7f57-0130-e345-282066132de2", "38343460-7f57-0130-e345-282066132de2", "384d3fa0-7f57-0130-e345-282066132de2", "38791c40-7f57-0130-e345-282066132de2", "38946f40-7f57-0130-e345-282066132de2", "3d0b15d0-7f57-0130-e345-282066132de2", "3d2054f0-7f57-0130-e345-282066132de2", "3915b1c0-7f57-0130-e345-282066132de2", "392cde50-7f57-0130-e345-282066132de2", "395a39c0-7f57-0130-e345-282066132de2", "396d5db0-7f57-0130-e345-282066132de2", "397e9f30-7f57-0130-e345-282066132de2", "3997d580-7f57-0130-e345-282066132de2", "39ac3fc0-7f57-0130-e345-282066132de2", "39c3d4e0-7f57-0130-e345-282066132de2", "3d9bd4f0-7f57-0130-e345-282066132de2", "3db09950-7f57-0130-e345-282066132de2", "3dc69b90-7f57-0130-e345-282066132de2", "3ddedb10-7f57-0130-e345-282066132de2", "3a6019a0-7f57-0130-e345-282066132de2", "3a6dc620-7f57-0130-e345-282066132de2", "3a884ee0-7f57-0130-e345-282066132de2", "3a9ea280-7f57-0130-e345-282066132de2", "3e795c30-7f57-0130-e345-282066132de2", "3e8d2a10-7f57-0130-e345-282066132de2", "3f2f7110-7f57-0130-e345-282066132de2", "3f3d3a50-7f57-0130-e345-282066132de2", "3f551340-7f57-0130-e345-282066132de2", "3f6943a0-7f57-0130-e345-282066132de2", "401029e0-7f57-0130-e345-282066132de2", "409cf0e0-7f57-0130-e345-282066132de2", "40a8d510-7f57-0130-e345-282066132de2", "4167fda0-7f57-0130-e345-282066132de2", "41e65bf0-7f57-0130-e345-282066132de2", "41f5ab70-7f57-0130-e345-282066132de2", "42288860-7f57-0130-e345-282066132de2", "423b3e80-7f57-0130-e345-282066132de2", "42c31630-7f57-0130-e345-282066132de2", "4342d570-7f57-0130-e345-282066132de2", "4359fcb0-7f57-0130-e345-282066132de2", "43d17810-7f57-0130-e345-282066132de2"])

    header('Accept', 'application/json')
    header('Content-Type', 'application/json')



  # Get the root JSON


    response = get "/"
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "actions": {
        "read": "http://example.org/"
    },
    "batches": {
        "actions": {
            "create": "http://example.org/batches",
            "read": "http://example.org/batches",
            "first": "http://example.org/batches/page=1",
            "last": "http://example.org/batches/page=-1"
        }
    },
    "users": {
        "actions": {
            "create": "http://example.org/users",
            "read": "http://example.org/users",
            "first": "http://example.org/users/page=1",
            "last": "http://example.org/users/page=-1"
        }
    },
    "studies": {
        "actions": {
            "create": "http://example.org/studies",
            "read": "http://example.org/studies",
            "first": "http://example.org/studies/page=1",
            "last": "http://example.org/studies/page=-1"
        }
    },
    "orders": {
        "actions": {
            "create": "http://example.org/orders",
            "read": "http://example.org/orders",
            "first": "http://example.org/orders/page=1",
            "last": "http://example.org/orders/page=-1"
        }
    },
    "samples": {
        "actions": {
            "create": "http://example.org/samples",
            "read": "http://example.org/samples",
            "first": "http://example.org/samples/page=1",
            "last": "http://example.org/samples/page=-1"
        }
    },
    "oligos": {
        "actions": {
            "create": "http://example.org/oligos",
            "read": "http://example.org/oligos",
            "first": "http://example.org/oligos/page=1",
            "last": "http://example.org/oligos/page=-1"
        }
    },
    "aliquots": {
        "actions": {
            "create": "http://example.org/aliquots",
            "read": "http://example.org/aliquots",
            "first": "http://example.org/aliquots/page=1",
            "last": "http://example.org/aliquots/page=-1"
        }
    },
    "flowcells": {
        "actions": {
            "create": "http://example.org/flowcells",
            "read": "http://example.org/flowcells",
            "first": "http://example.org/flowcells/page=1",
            "last": "http://example.org/flowcells/page=-1"
        }
    },
    "gels": {
        "actions": {
            "create": "http://example.org/gels",
            "read": "http://example.org/gels",
            "first": "http://example.org/gels/page=1",
            "last": "http://example.org/gels/page=-1"
        }
    },
    "labellables": {
        "actions": {
            "create": "http://example.org/labellables",
            "read": "http://example.org/labellables",
            "first": "http://example.org/labellables/page=1",
            "last": "http://example.org/labellables/page=-1"
        }
    },
    "sanger_barcodes": {
        "actions": {
            "create": "http://example.org/sanger_barcodes",
            "read": "http://example.org/sanger_barcodes",
            "first": "http://example.org/sanger_barcodes/page=1",
            "last": "http://example.org/sanger_barcodes/page=-1"
        }
    },
    "ean13_barcodes": {
        "actions": {
            "create": "http://example.org/ean13_barcodes",
            "read": "http://example.org/ean13_barcodes",
            "first": "http://example.org/ean13_barcodes/page=1",
            "last": "http://example.org/ean13_barcodes/page=-1"
        }
    },
    "barcode2_ds": {
        "actions": {
            "create": "http://example.org/barcode2_ds",
            "read": "http://example.org/barcode2_ds",
            "first": "http://example.org/barcode2_ds/page=1",
            "last": "http://example.org/barcode2_ds/page=-1"
        }
    },
    "plates": {
        "actions": {
            "create": "http://example.org/plates",
            "read": "http://example.org/plates",
            "first": "http://example.org/plates/page=1",
            "last": "http://example.org/plates/page=-1"
        }
    },
    "spin_columns": {
        "actions": {
            "create": "http://example.org/spin_columns",
            "read": "http://example.org/spin_columns",
            "first": "http://example.org/spin_columns/page=1",
            "last": "http://example.org/spin_columns/page=-1"
        }
    },
    "tubes": {
        "actions": {
            "create": "http://example.org/tubes",
            "read": "http://example.org/tubes",
            "first": "http://example.org/tubes/page=1",
            "last": "http://example.org/tubes/page=-1"
        }
    },
    "tube_racks": {
        "actions": {
            "create": "http://example.org/tube_racks",
            "read": "http://example.org/tube_racks",
            "first": "http://example.org/tube_racks/page=1",
            "last": "http://example.org/tube_racks/page=-1"
        }
    },
    "tag_groups": {
        "actions": {
            "create": "http://example.org/tag_groups",
            "read": "http://example.org/tag_groups",
            "first": "http://example.org/tag_groups/page=1",
            "last": "http://example.org/tag_groups/page=-1"
        }
    },
    "searches": {
        "actions": {
            "create": "http://example.org/searches",
            "read": "http://example.org/searches",
            "first": "http://example.org/searches/page=1",
            "last": "http://example.org/searches/page=-1"
        }
    },
    "multi_criteria_filters": {
        "actions": {
            "create": "http://example.org/multi_criteria_filters",
            "read": "http://example.org/multi_criteria_filters",
            "first": "http://example.org/multi_criteria_filters/page=1",
            "last": "http://example.org/multi_criteria_filters/page=-1"
        }
    },
    "label_filters": {
        "actions": {
            "create": "http://example.org/label_filters",
            "read": "http://example.org/label_filters",
            "first": "http://example.org/label_filters/page=1",
            "last": "http://example.org/label_filters/page=-1"
        }
    },
    "order_filters": {
        "actions": {
            "create": "http://example.org/order_filters",
            "read": "http://example.org/order_filters",
            "first": "http://example.org/order_filters/page=1",
            "last": "http://example.org/order_filters/page=-1"
        }
    },
    "batch_filters": {
        "actions": {
            "create": "http://example.org/batch_filters",
            "read": "http://example.org/batch_filters",
            "first": "http://example.org/batch_filters/page=1",
            "last": "http://example.org/batch_filters/page=-1"
        }
    },
    "uuid_resources": {
        "actions": {
            "create": "http://example.org/uuid_resources",
            "read": "http://example.org/uuid_resources",
            "first": "http://example.org/uuid_resources/page=1",
            "last": "http://example.org/uuid_resources/page=-1"
        }
    },
    "create_batches": {
        "actions": {
            "create": "http://example.org/actions/create_batch"
        }
    },
    "create_flowcells": {
        "actions": {
            "create": "http://example.org/actions/create_flowcell"
        }
    },
    "create_gels": {
        "actions": {
            "create": "http://example.org/actions/create_gel"
        }
    },
    "create_labels": {
        "actions": {
            "create": "http://example.org/actions/create_label"
        }
    },
    "create_labellables": {
        "actions": {
            "create": "http://example.org/actions/create_labellable"
        }
    },
    "create_orders": {
        "actions": {
            "create": "http://example.org/actions/create_order"
        }
    },
    "create_plates": {
        "actions": {
            "create": "http://example.org/actions/create_plate"
        }
    },
    "create_searches": {
        "actions": {
            "create": "http://example.org/actions/create_search"
        }
    },
    "create_spin_columns": {
        "actions": {
            "create": "http://example.org/actions/create_spin_column"
        }
    },
    "create_tubes": {
        "actions": {
            "create": "http://example.org/actions/create_tube"
        }
    },
    "create_tube_racks": {
        "actions": {
            "create": "http://example.org/actions/create_tube_rack"
        }
    },
    "plate_transfers": {
        "actions": {
            "create": "http://example.org/actions/plate_transfer"
        }
    },
    "tag_wells": {
        "actions": {
            "create": "http://example.org/actions/tag_wells"
        }
    },
    "transfer_plates_to_plates": {
        "actions": {
            "create": "http://example.org/actions/transfer_plates_to_plates"
        }
    },
    "transfer_tubes_to_tubes": {
        "actions": {
            "create": "http://example.org/actions/transfer_tubes_to_tubes"
        }
    },
    "transfer_wells_to_tubes": {
        "actions": {
            "create": "http://example.org/actions/transfer_wells_to_tubes"
        }
    },
    "tube_rack_moves": {
        "actions": {
            "create": "http://example.org/actions/tube_rack_move"
        }
    },
    "tube_rack_transfers": {
        "actions": {
            "create": "http://example.org/actions/tube_rack_transfer"
        }
    },
    "update_batches": {
        "actions": {
            "create": "http://example.org/actions/update_batch"
        }
    },
    "update_orders": {
        "actions": {
            "create": "http://example.org/actions/update_order"
        }
    },
    "update_plates": {
        "actions": {
            "create": "http://example.org/actions/update_plate"
        }
    },
    "update_tubes": {
        "actions": {
            "create": "http://example.org/actions/update_tube"
        }
    },
    "update_tube_racks": {
        "actions": {
            "create": "http://example.org/actions/update_tube_rack"
        }
    },
    "revision": 3
}
    EOD



  # Find tube by barcode for 1220017279667


    response = post "/searches", <<-EOD
    {
    "search": {
        "user": "username",
        "description": "search for barcoded tube",
        "model": "tube",
        "criteria": {
            "label": {
                "position": "barcode",
                "type": "ean13-barcode",
                "value": "1220017279667"
            }
        }
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "search": {
        "actions": {
            "read": "http://example.org/349460b0-7f57-0130-e345-282066132de2",
            "first": "http://example.org/349460b0-7f57-0130-e345-282066132de2/page=1",
            "last": "http://example.org/349460b0-7f57-0130-e345-282066132de2/page=-1"
        },
        "uuid": "349460b0-7f57-0130-e345-282066132de2"
    }
}
    EOD

  # Get the search result (tube)


    response = get "/349460b0-7f57-0130-e345-282066132de2/page=1"
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "actions": {
        "read": "http://example.org/tubes/page=1",
        "first": "http://example.org/tubes/page=1",
        "last": "http://example.org/tubes/page=-1"
    },
    "size": 1,
    "tubes": [
        {
            "actions": {
                "read": "http://example.org/2ea58a10-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea58a10-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea58a10-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea58a10-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
            "type": null,
            "max_volume": null,
            "aliquots": [
                {
                    "sample": {
                        "actions": {
                            "read": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                            "create": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                            "update": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                            "delete": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2"
                        },
                        "uuid": "2ea393c0-7f57-0130-e344-282066132de2",
                        "name": "sample_0"
                    },
                    "quantity": 1000,
                    "type": "NA+P",
                    "unit": "mole"
                }
            ],
            "labels": {
                "actions": {
                    "read": "http://example.org/2ea59590-7f57-0130-e344-282066132de2",
                    "create": "http://example.org/2ea59590-7f57-0130-e344-282066132de2",
                    "update": "http://example.org/2ea59590-7f57-0130-e344-282066132de2",
                    "delete": "http://example.org/2ea59590-7f57-0130-e344-282066132de2"
                },
                "uuid": "2ea59590-7f57-0130-e344-282066132de2",
                "barcode": {
                    "value": "1220017279667",
                    "type": "ean13-barcode"
                }
            }
        }
    ]
}
    EOD

  # Find tube by barcode for 1220017279668


    response = post "/searches", <<-EOD
    {
    "search": {
        "user": "username",
        "description": "search for barcoded tube",
        "model": "tube",
        "criteria": {
            "label": {
                "position": "barcode",
                "type": "ean13-barcode",
                "value": "1220017279668"
            }
        }
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "search": {
        "actions": {
            "read": "http://example.org/349969d0-7f57-0130-e345-282066132de2",
            "first": "http://example.org/349969d0-7f57-0130-e345-282066132de2/page=1",
            "last": "http://example.org/349969d0-7f57-0130-e345-282066132de2/page=-1"
        },
        "uuid": "349969d0-7f57-0130-e345-282066132de2"
    }
}
    EOD

  # Get the search result (tube)


    response = get "/349969d0-7f57-0130-e345-282066132de2/page=1"
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "actions": {
        "read": "http://example.org/tubes/page=1",
        "first": "http://example.org/tubes/page=1",
        "last": "http://example.org/tubes/page=-1"
    },
    "size": 1,
    "tubes": [
        {
            "actions": {
                "read": "http://example.org/2ea6d7b0-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea6d7b0-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea6d7b0-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea6d7b0-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
            "type": null,
            "max_volume": null,
            "aliquots": [
                {
                    "sample": {
                        "actions": {
                            "read": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                            "create": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                            "update": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                            "delete": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2"
                        },
                        "uuid": "2ea423b0-7f57-0130-e344-282066132de2",
                        "name": "sample_1"
                    },
                    "quantity": 1000,
                    "type": "NA+P",
                    "unit": "mole"
                }
            ],
            "labels": {
                "actions": {
                    "read": "http://example.org/2ea6e160-7f57-0130-e344-282066132de2",
                    "create": "http://example.org/2ea6e160-7f57-0130-e344-282066132de2",
                    "update": "http://example.org/2ea6e160-7f57-0130-e344-282066132de2",
                    "delete": "http://example.org/2ea6e160-7f57-0130-e344-282066132de2"
                },
                "uuid": "2ea6e160-7f57-0130-e344-282066132de2",
                "barcode": {
                    "value": "1220017279668",
                    "type": "ean13-barcode"
                }
            }
        }
    ]
}
    EOD

  # Find the order by tube uuid and role


    response = post "/searches", <<-EOD
    {
    "search": {
        "user": "username",
        "description": "search for order",
        "model": "order",
        "criteria": {
            "item": {
                "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                "role": "tube_to_be_extracted_nap"
            }
        }
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "search": {
        "actions": {
            "read": "http://example.org/349e3760-7f57-0130-e345-282066132de2",
            "first": "http://example.org/349e3760-7f57-0130-e345-282066132de2/page=1",
            "last": "http://example.org/349e3760-7f57-0130-e345-282066132de2/page=-1"
        },
        "uuid": "349e3760-7f57-0130-e345-282066132de2"
    }
}
    EOD

  # Get the search results (order)


    response = get "/349e3760-7f57-0130-e345-282066132de2/page=1"
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "actions": {
        "read": "http://example.org/orders/page=1",
        "first": "http://example.org/orders/page=1",
        "last": "http://example.org/orders/page=-1"
    },
    "size": 1,
    "orders": [
        {
            "actions": {
                "read": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea9d600-7f57-0130-e344-282066132de2",
            "pipeline": "DNA+RNA manual extraction",
            "status": "draft",
            "parameters": {
            },
            "state": {
            },
            "cost_code": "cost code",
            "creator": {
                "actions": {
                    "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                    "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                    "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                    "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
                },
                "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
            },
            "study": {
                "actions": {
                    "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                    "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                    "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                    "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
                },
                "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "items": {
                "tube_to_be_extracted_nap": [
                    {
                        "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                        "status": "done",
                        "batch": null
                    },
                    {
                        "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                        "status": "done",
                        "batch": null
                    }
                ]
            }
        }
    ]
}
    EOD

  # Create a new batch


    response = post "/batches", <<-EOD
    {
    "batch": {
        "user": "username"
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "batch": {
        "actions": {
            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
        },
        "uuid": "34a52320-7f57-0130-e345-282066132de2",
        "process": null,
        "kit": null
    }
}
    EOD

  # Assign the batch uuid to the tubes in the order items


    response = put "/2ea9d600-7f57-0130-e344-282066132de2", <<-EOD
    {
    "items": {
        "tube_to_be_extracted_nap": {
            "2ea58a10-7f57-0130-e344-282066132de2": {
                "batch_uuid": "34a52320-7f57-0130-e345-282066132de2"
            },
            "2ea6d7b0-7f57-0130-e344-282066132de2": {
                "batch_uuid": "34a52320-7f57-0130-e345-282066132de2"
            }
        }
    },
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2"
        },
        "uuid": "2ea9d600-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "draft",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": null
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": null
                    }
                }
            ]
        }
    }
}
    EOD

  # Add the tube_to_be_extracted_nap under the role binding_tube_to_be_extracted_nap and start them.


    response = put "/2ea9d600-7f57-0130-e344-282066132de2", <<-EOD
    {
    "items": {
        "binding_tube_to_be_extracted_nap": {
            "2ea58a10-7f57-0130-e344-282066132de2": {
                "event": "start",
                "batch_uuid": "34a52320-7f57-0130-e345-282066132de2"
            },
            "2ea6d7b0-7f57-0130-e344-282066132de2": {
                "event": "start",
                "batch_uuid": "34a52320-7f57-0130-e345-282066132de2"
            }
        }
    },
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2"
        },
        "uuid": "2ea9d600-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "draft",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": null
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": null
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "in_progress",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": null
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "in_progress",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": null
                    }
                }
            ]
        }
    }
}
    EOD

  # Change the status of binding_tube_to_be_extracted_nap to done. Change the status of tube_to_be_extracted_nap to unused.


    response = put "/2ea9d600-7f57-0130-e344-282066132de2", <<-EOD
    {
    "items": {
        "binding_tube_to_be_extracted_nap": {
            "2ea58a10-7f57-0130-e344-282066132de2": {
                "event": "complete"
            },
            "2ea6d7b0-7f57-0130-e344-282066132de2": {
                "event": "complete"
            }
        },
        "tube_to_be_extracted_nap": {
            "2ea58a10-7f57-0130-e344-282066132de2": {
                "event": "unuse"
            },
            "2ea6d7b0-7f57-0130-e344-282066132de2": {
                "event": "unuse"
            }
        }
    },
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2"
        },
        "uuid": "2ea9d600-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "draft",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": null
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": null
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": null
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": null
                    }
                }
            ]
        }
    }
}
    EOD

  # Find tube by barcode for 1220017279669


    response = post "/searches", <<-EOD
    {
    "search": {
        "user": "username",
        "description": "search for barcoded tube",
        "model": "tube",
        "criteria": {
            "label": {
                "position": "barcode",
                "type": "ean13-barcode",
                "value": "1220017279669"
            }
        }
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "search": {
        "actions": {
            "read": "http://example.org/35237a40-7f57-0130-e345-282066132de2",
            "first": "http://example.org/35237a40-7f57-0130-e345-282066132de2/page=1",
            "last": "http://example.org/35237a40-7f57-0130-e345-282066132de2/page=-1"
        },
        "uuid": "35237a40-7f57-0130-e345-282066132de2"
    }
}
    EOD

  # Get the search result (tube)


    response = get "/35237a40-7f57-0130-e345-282066132de2/page=1"
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "actions": {
        "read": "http://example.org/tubes/page=1",
        "first": "http://example.org/tubes/page=1",
        "last": "http://example.org/tubes/page=-1"
    },
    "size": 1,
    "tubes": [
        {
            "actions": {
                "read": "http://example.org/2ea83c50-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea83c50-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea83c50-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea83c50-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
            "type": null,
            "max_volume": null,
            "aliquots": [
                {
                    "sample": {
                        "actions": {
                            "read": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                            "create": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                            "update": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                            "delete": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2"
                        },
                        "uuid": "2ea4b420-7f57-0130-e344-282066132de2",
                        "name": "sample_2"
                    },
                    "quantity": 1000,
                    "type": "NA+P",
                    "unit": "mole"
                }
            ],
            "labels": {
                "actions": {
                    "read": "http://example.org/2ea84ed0-7f57-0130-e344-282066132de2",
                    "create": "http://example.org/2ea84ed0-7f57-0130-e344-282066132de2",
                    "update": "http://example.org/2ea84ed0-7f57-0130-e344-282066132de2",
                    "delete": "http://example.org/2ea84ed0-7f57-0130-e344-282066132de2"
                },
                "uuid": "2ea84ed0-7f57-0130-e344-282066132de2",
                "barcode": {
                    "value": "1220017279669",
                    "type": "ean13-barcode"
                }
            }
        }
    ]
}
    EOD

  # Find the order by tube uuid and role


    response = post "/searches", <<-EOD
    {
    "search": {
        "user": "username",
        "description": "search for order",
        "model": "order",
        "criteria": {
            "item": {
                "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                "role": "tube_to_be_extracted_nap"
            }
        }
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "search": {
        "actions": {
            "read": "http://example.org/355d01d0-7f57-0130-e345-282066132de2",
            "first": "http://example.org/355d01d0-7f57-0130-e345-282066132de2/page=1",
            "last": "http://example.org/355d01d0-7f57-0130-e345-282066132de2/page=-1"
        },
        "uuid": "355d01d0-7f57-0130-e345-282066132de2"
    }
}
    EOD

  # Get the search results (order)


    response = get "/355d01d0-7f57-0130-e345-282066132de2/page=1"
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "actions": {
        "read": "http://example.org/orders/page=1",
        "first": "http://example.org/orders/page=1",
        "last": "http://example.org/orders/page=-1"
    },
    "size": 1,
    "orders": [
        {
            "actions": {
                "read": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2"
            },
            "uuid": "2eaaf660-7f57-0130-e344-282066132de2",
            "pipeline": "DNA+RNA manual extraction",
            "status": "draft",
            "parameters": {
            },
            "state": {
            },
            "cost_code": "cost code",
            "creator": {
                "actions": {
                    "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                    "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                    "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                    "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
                },
                "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
            },
            "study": {
                "actions": {
                    "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                    "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                    "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                    "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
                },
                "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "items": {
                "tube_to_be_extracted_nap": [
                    {
                        "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                        "status": "done",
                        "batch": null
                    }
                ]
            }
        }
    ]
}
    EOD

  # Assign the batch uuid to the tubes in the order items


    response = put "/2eaaf660-7f57-0130-e344-282066132de2", <<-EOD
    {
    "items": {
        "tube_to_be_extracted_nap": {
            "2ea83c50-7f57-0130-e344-282066132de2": {
                "batch_uuid": "34a52320-7f57-0130-e345-282066132de2"
            }
        }
    },
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2"
        },
        "uuid": "2eaaf660-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "draft",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": null
                    }
                }
            ]
        }
    }
}
    EOD

  # Add the tube_to_be_extracted_nap under the role binding_tube_to_be_extracted_nap and start them.


    response = put "/2eaaf660-7f57-0130-e344-282066132de2", <<-EOD
    {
    "items": {
        "binding_tube_to_be_extracted_nap": {
            "2ea83c50-7f57-0130-e344-282066132de2": {
                "event": "start",
                "batch_uuid": "34a52320-7f57-0130-e345-282066132de2"
            }
        }
    },
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2"
        },
        "uuid": "2eaaf660-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "draft",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": null
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "in_progress",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": null
                    }
                }
            ]
        }
    }
}
    EOD

  # Change the status of binding_tube_to_be_extracted_nap to done. Change the status of tube_to_be_extracted_nap to unused.


    response = put "/2eaaf660-7f57-0130-e344-282066132de2", <<-EOD
    {
    "items": {
        "binding_tube_to_be_extracted_nap": {
            "2ea83c50-7f57-0130-e344-282066132de2": {
                "event": "complete"
            }
        },
        "tube_to_be_extracted_nap": {
            "2ea83c50-7f57-0130-e344-282066132de2": {
                "event": "unuse"
            }
        }
    },
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2"
        },
        "uuid": "2eaaf660-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "draft",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": null
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": null
                    }
                }
            ]
        }
    }
}
    EOD

  # Add the kit barcode to the batch


    response = put "/34a52320-7f57-0130-e345-282066132de2", <<-EOD
    {
    "kit": "1234567891011",
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "batch": {
        "actions": {
            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
        },
        "uuid": "34a52320-7f57-0130-e345-282066132de2",
        "process": null,
        "kit": "1234567891011"
    }
}
    EOD



  # Create the search order by batch


    response = post "/searches", <<-EOD
    {
    "search": {
        "user": "username",
        "description": "search order by batch",
        "model": "order",
        "criteria": {
            "item": {
                "batch": "34a52320-7f57-0130-e345-282066132de2"
            }
        }
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "search": {
        "actions": {
            "read": "http://example.org/35f1f2c0-7f57-0130-e345-282066132de2",
            "first": "http://example.org/35f1f2c0-7f57-0130-e345-282066132de2/page=1",
            "last": "http://example.org/35f1f2c0-7f57-0130-e345-282066132de2/page=-1"
        },
        "uuid": "35f1f2c0-7f57-0130-e345-282066132de2"
    }
}
    EOD

  # Get the result orders


    response = get "/35f1f2c0-7f57-0130-e345-282066132de2/page=1"
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "actions": {
        "read": "http://example.org/orders/page=1",
        "first": "http://example.org/orders/page=1",
        "last": "http://example.org/orders/page=-1"
    },
    "size": 2,
    "orders": [
        {
            "actions": {
                "read": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea9d600-7f57-0130-e344-282066132de2",
            "pipeline": "DNA+RNA manual extraction",
            "status": "draft",
            "parameters": {
            },
            "state": {
            },
            "cost_code": "cost code",
            "creator": {
                "actions": {
                    "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                    "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                    "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                    "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
                },
                "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
            },
            "study": {
                "actions": {
                    "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                    "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                    "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                    "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
                },
                "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "items": {
                "tube_to_be_extracted_nap": [
                    {
                        "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                        "status": "unused",
                        "batch": {
                            "actions": {
                                "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "34a52320-7f57-0130-e345-282066132de2",
                            "process": null,
                            "kit": "1234567891011"
                        }
                    },
                    {
                        "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                        "status": "unused",
                        "batch": {
                            "actions": {
                                "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "34a52320-7f57-0130-e345-282066132de2",
                            "process": null,
                            "kit": "1234567891011"
                        }
                    }
                ],
                "binding_tube_to_be_extracted_nap": [
                    {
                        "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                        "status": "done",
                        "batch": {
                            "actions": {
                                "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "34a52320-7f57-0130-e345-282066132de2",
                            "process": null,
                            "kit": "1234567891011"
                        }
                    },
                    {
                        "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                        "status": "done",
                        "batch": {
                            "actions": {
                                "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "34a52320-7f57-0130-e345-282066132de2",
                            "process": null,
                            "kit": "1234567891011"
                        }
                    }
                ]
            }
        },
        {
            "actions": {
                "read": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2"
            },
            "uuid": "2eaaf660-7f57-0130-e344-282066132de2",
            "pipeline": "DNA+RNA manual extraction",
            "status": "draft",
            "parameters": {
            },
            "state": {
            },
            "cost_code": "cost code",
            "creator": {
                "actions": {
                    "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                    "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                    "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                    "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
                },
                "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
            },
            "study": {
                "actions": {
                    "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                    "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                    "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                    "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
                },
                "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "items": {
                "tube_to_be_extracted_nap": [
                    {
                        "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                        "status": "unused",
                        "batch": {
                            "actions": {
                                "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "34a52320-7f57-0130-e345-282066132de2",
                            "process": null,
                            "kit": "1234567891011"
                        }
                    }
                ],
                "binding_tube_to_be_extracted_nap": [
                    {
                        "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                        "status": "done",
                        "batch": {
                            "actions": {
                                "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "34a52320-7f57-0130-e345-282066132de2",
                            "process": null,
                            "kit": "1234567891011"
                        }
                    }
                ]
            }
        }
    ]
}
    EOD



  # Change the status of the order to pending


    response = put "/2ea9d600-7f57-0130-e344-282066132de2", <<-EOD
    {
    "event": "build",
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2"
        },
        "uuid": "2ea9d600-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "pending",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ]
        }
    }
}
    EOD

  # Change the status of the order to in_progress


    response = put "/2ea9d600-7f57-0130-e344-282066132de2", <<-EOD
    {
    "event": "start",
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2"
        },
        "uuid": "2ea9d600-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "in_progress",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ]
        }
    }
}
    EOD



  # Change the status of the order to pending


    response = put "/2eaaf660-7f57-0130-e344-282066132de2", <<-EOD
    {
    "event": "build",
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2"
        },
        "uuid": "2eaaf660-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "pending",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ]
        }
    }
}
    EOD

  # Change the status of the order to in_progress


    response = put "/2eaaf660-7f57-0130-e344-282066132de2", <<-EOD
    {
    "event": "start",
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2"
        },
        "uuid": "2eaaf660-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "in_progress",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ]
        }
    }
}
    EOD



  # Create new spin columns


    response = post "/spin_columns", <<-EOD
    {
    "spin_column": {
        "user": "username"
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "spin_column": {
        "actions": {
            "read": "http://example.org/362fbaa0-7f57-0130-e345-282066132de2",
            "create": "http://example.org/362fbaa0-7f57-0130-e345-282066132de2",
            "update": "http://example.org/362fbaa0-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/362fbaa0-7f57-0130-e345-282066132de2"
        },
        "uuid": "362fbaa0-7f57-0130-e345-282066132de2",
        "aliquots": [

        ]
    }
}
    EOD



    response = post "/labellables", <<-EOD
    {
    "labellable": {
        "user": "username",
        "name": "362fbaa0-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567891000",
                "type": "ean13-barcode"
            }
        }
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "labellable": {
        "actions": {
            "read": "http://example.org/36437e60-7f57-0130-e345-282066132de2",
            "create": "http://example.org/36437e60-7f57-0130-e345-282066132de2",
            "update": "http://example.org/36437e60-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/36437e60-7f57-0130-e345-282066132de2"
        },
        "uuid": "36437e60-7f57-0130-e345-282066132de2",
        "name": "362fbaa0-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567891000",
                "type": "ean13-barcode"
            }
        }
    }
}
    EOD



    response = post "/spin_columns", <<-EOD
    {
    "spin_column": {
        "user": "username"
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "spin_column": {
        "actions": {
            "read": "http://example.org/365fd5b0-7f57-0130-e345-282066132de2",
            "create": "http://example.org/365fd5b0-7f57-0130-e345-282066132de2",
            "update": "http://example.org/365fd5b0-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/365fd5b0-7f57-0130-e345-282066132de2"
        },
        "uuid": "365fd5b0-7f57-0130-e345-282066132de2",
        "aliquots": [

        ]
    }
}
    EOD



    response = post "/labellables", <<-EOD
    {
    "labellable": {
        "user": "username",
        "name": "365fd5b0-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567892000",
                "type": "ean13-barcode"
            }
        }
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "labellable": {
        "actions": {
            "read": "http://example.org/36761180-7f57-0130-e345-282066132de2",
            "create": "http://example.org/36761180-7f57-0130-e345-282066132de2",
            "update": "http://example.org/36761180-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/36761180-7f57-0130-e345-282066132de2"
        },
        "uuid": "36761180-7f57-0130-e345-282066132de2",
        "name": "365fd5b0-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567892000",
                "type": "ean13-barcode"
            }
        }
    }
}
    EOD

  # Create new tubes 


    response = post "/tubes", <<-EOD
    {
    "tube": {
        "user": "username"
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "tube": {
        "actions": {
            "read": "http://example.org/368d90c0-7f57-0130-e345-282066132de2",
            "create": "http://example.org/368d90c0-7f57-0130-e345-282066132de2",
            "update": "http://example.org/368d90c0-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/368d90c0-7f57-0130-e345-282066132de2"
        },
        "uuid": "368d90c0-7f57-0130-e345-282066132de2",
        "type": null,
        "max_volume": null,
        "aliquots": [

        ]
    }
}
    EOD



    response = post "/labellables", <<-EOD
    {
    "labellable": {
        "user": "username",
        "name": "368d90c0-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567893000",
                "type": "ean13-barcode"
            }
        }
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "labellable": {
        "actions": {
            "read": "http://example.org/36a3d7a0-7f57-0130-e345-282066132de2",
            "create": "http://example.org/36a3d7a0-7f57-0130-e345-282066132de2",
            "update": "http://example.org/36a3d7a0-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/36a3d7a0-7f57-0130-e345-282066132de2"
        },
        "uuid": "36a3d7a0-7f57-0130-e345-282066132de2",
        "name": "368d90c0-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567893000",
                "type": "ean13-barcode"
            }
        }
    }
}
    EOD



    response = post "/tubes", <<-EOD
    {
    "tube": {
        "user": "username"
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "tube": {
        "actions": {
            "read": "http://example.org/36bb5bd0-7f57-0130-e345-282066132de2",
            "create": "http://example.org/36bb5bd0-7f57-0130-e345-282066132de2",
            "update": "http://example.org/36bb5bd0-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/36bb5bd0-7f57-0130-e345-282066132de2"
        },
        "uuid": "36bb5bd0-7f57-0130-e345-282066132de2",
        "type": null,
        "max_volume": null,
        "aliquots": [

        ]
    }
}
    EOD



    response = post "/labellables", <<-EOD
    {
    "labellable": {
        "user": "username",
        "name": "36bb5bd0-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567894000",
                "type": "ean13-barcode"
            }
        }
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "labellable": {
        "actions": {
            "read": "http://example.org/36cfea70-7f57-0130-e345-282066132de2",
            "create": "http://example.org/36cfea70-7f57-0130-e345-282066132de2",
            "update": "http://example.org/36cfea70-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/36cfea70-7f57-0130-e345-282066132de2"
        },
        "uuid": "36cfea70-7f57-0130-e345-282066132de2",
        "name": "36bb5bd0-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567894000",
                "type": "ean13-barcode"
            }
        }
    }
}
    EOD

  # Add the new spin columns and new tubes in the order and start each of them


    response = put "/2ea9d600-7f57-0130-e344-282066132de2", <<-EOD
    {
    "items": {
        "binding_spin_column_dna": {
            "362fbaa0-7f57-0130-e345-282066132de2": {
                "event": "start",
                "batch_uuid": "34a52320-7f57-0130-e345-282066132de2"
            },
            "365fd5b0-7f57-0130-e345-282066132de2": {
                "event": "start",
                "batch_uuid": "34a52320-7f57-0130-e345-282066132de2"
            }
        },
        "by_product_tube_rnap": {
            "368d90c0-7f57-0130-e345-282066132de2": {
                "event": "start",
                "batch_uuid": "34a52320-7f57-0130-e345-282066132de2"
            },
            "36bb5bd0-7f57-0130-e345-282066132de2": {
                "event": "start",
                "batch_uuid": "34a52320-7f57-0130-e345-282066132de2"
            }
        }
    },
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2"
        },
        "uuid": "2ea9d600-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "in_progress",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_dna": [
                {
                    "uuid": "362fbaa0-7f57-0130-e345-282066132de2",
                    "status": "in_progress",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "365fd5b0-7f57-0130-e345-282066132de2",
                    "status": "in_progress",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "by_product_tube_rnap": [
                {
                    "uuid": "368d90c0-7f57-0130-e345-282066132de2",
                    "status": "in_progress",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "36bb5bd0-7f57-0130-e345-282066132de2",
                    "status": "in_progress",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ]
        }
    }
}
    EOD

  # Transfers from tube_to_be_extracted into binding_spin_column_dna spins and into by_product_tube tubes.


    response = post "/actions/transfer_tubes_to_tubes", <<-EOD
    {
    "transfer_tubes_to_tubes": {
        "user": "username",
        "transfers": [
            {
                "source_uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                "target_uuid": "362fbaa0-7f57-0130-e345-282066132de2",
                "fraction": 0.5,
                "aliquot_type": "DNA"
            },
            {
                "source_uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                "target_uuid": "365fd5b0-7f57-0130-e345-282066132de2",
                "fraction": 0.5,
                "aliquot_type": "DNA"
            },
            {
                "source_uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                "target_uuid": "368d90c0-7f57-0130-e345-282066132de2",
                "fraction": 0.5,
                "aliquot_type": "RNA+P"
            },
            {
                "source_uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                "target_uuid": "36bb5bd0-7f57-0130-e345-282066132de2",
                "fraction": 0.5,
                "aliquot_type": "RNA+P"
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
        "user": "username",
        "application": "application",
        "result": {
            "sources": [
                {
                    "tube": {
                        "actions": {
                            "read": "http://example.org/2ea58a10-7f57-0130-e344-282066132de2",
                            "create": "http://example.org/2ea58a10-7f57-0130-e344-282066132de2",
                            "update": "http://example.org/2ea58a10-7f57-0130-e344-282066132de2",
                            "delete": "http://example.org/2ea58a10-7f57-0130-e344-282066132de2"
                        },
                        "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                        "type": null,
                        "max_volume": null,
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea393c0-7f57-0130-e344-282066132de2",
                                    "name": "sample_0"
                                },
                                "quantity": 1000,
                                "type": "NA+P",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/2ea59590-7f57-0130-e344-282066132de2",
                                "create": "http://example.org/2ea59590-7f57-0130-e344-282066132de2",
                                "update": "http://example.org/2ea59590-7f57-0130-e344-282066132de2",
                                "delete": "http://example.org/2ea59590-7f57-0130-e344-282066132de2"
                            },
                            "uuid": "2ea59590-7f57-0130-e344-282066132de2",
                            "barcode": {
                                "value": "1220017279667",
                                "type": "ean13-barcode"
                            }
                        }
                    }
                },
                {
                    "tube": {
                        "actions": {
                            "read": "http://example.org/2ea6d7b0-7f57-0130-e344-282066132de2",
                            "create": "http://example.org/2ea6d7b0-7f57-0130-e344-282066132de2",
                            "update": "http://example.org/2ea6d7b0-7f57-0130-e344-282066132de2",
                            "delete": "http://example.org/2ea6d7b0-7f57-0130-e344-282066132de2"
                        },
                        "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                        "type": null,
                        "max_volume": null,
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea423b0-7f57-0130-e344-282066132de2",
                                    "name": "sample_1"
                                },
                                "quantity": 1000,
                                "type": "NA+P",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/2ea6e160-7f57-0130-e344-282066132de2",
                                "create": "http://example.org/2ea6e160-7f57-0130-e344-282066132de2",
                                "update": "http://example.org/2ea6e160-7f57-0130-e344-282066132de2",
                                "delete": "http://example.org/2ea6e160-7f57-0130-e344-282066132de2"
                            },
                            "uuid": "2ea6e160-7f57-0130-e344-282066132de2",
                            "barcode": {
                                "value": "1220017279668",
                                "type": "ean13-barcode"
                            }
                        }
                    }
                }
            ],
            "targets": [
                {
                    "spin_column": {
                        "actions": {
                            "read": "http://example.org/362fbaa0-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/362fbaa0-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/362fbaa0-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/362fbaa0-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "362fbaa0-7f57-0130-e345-282066132de2",
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea393c0-7f57-0130-e344-282066132de2",
                                    "name": "sample_0"
                                },
                                "type": "DNA",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/36437e60-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/36437e60-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/36437e60-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/36437e60-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "36437e60-7f57-0130-e345-282066132de2",
                            "barcode": {
                                "value": "1234567891000",
                                "type": "ean13-barcode"
                            }
                        }
                    }
                },
                {
                    "spin_column": {
                        "actions": {
                            "read": "http://example.org/365fd5b0-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/365fd5b0-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/365fd5b0-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/365fd5b0-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "365fd5b0-7f57-0130-e345-282066132de2",
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea423b0-7f57-0130-e344-282066132de2",
                                    "name": "sample_1"
                                },
                                "type": "DNA",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/36761180-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/36761180-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/36761180-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/36761180-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "36761180-7f57-0130-e345-282066132de2",
                            "barcode": {
                                "value": "1234567892000",
                                "type": "ean13-barcode"
                            }
                        }
                    }
                },
                {
                    "tube": {
                        "actions": {
                            "read": "http://example.org/368d90c0-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/368d90c0-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/368d90c0-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/368d90c0-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "368d90c0-7f57-0130-e345-282066132de2",
                        "type": null,
                        "max_volume": null,
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea393c0-7f57-0130-e344-282066132de2",
                                    "name": "sample_0"
                                },
                                "type": "RNA+P",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/36a3d7a0-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/36a3d7a0-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/36a3d7a0-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/36a3d7a0-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "36a3d7a0-7f57-0130-e345-282066132de2",
                            "barcode": {
                                "value": "1234567893000",
                                "type": "ean13-barcode"
                            }
                        }
                    }
                },
                {
                    "tube": {
                        "actions": {
                            "read": "http://example.org/36bb5bd0-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/36bb5bd0-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/36bb5bd0-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/36bb5bd0-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "36bb5bd0-7f57-0130-e345-282066132de2",
                        "type": null,
                        "max_volume": null,
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea423b0-7f57-0130-e344-282066132de2",
                                    "name": "sample_1"
                                },
                                "type": "RNA+P",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/36cfea70-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/36cfea70-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/36cfea70-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/36cfea70-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "36cfea70-7f57-0130-e345-282066132de2",
                            "barcode": {
                                "value": "1234567894000",
                                "type": "ean13-barcode"
                            }
                        }
                    }
                }
            ]
        },
        "transfers": [
            {
                "source_uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                "target_uuid": "362fbaa0-7f57-0130-e345-282066132de2",
                "fraction": 0.5,
                "aliquot_type": "DNA"
            },
            {
                "source_uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                "target_uuid": "365fd5b0-7f57-0130-e345-282066132de2",
                "fraction": 0.5,
                "aliquot_type": "DNA"
            },
            {
                "source_uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                "target_uuid": "368d90c0-7f57-0130-e345-282066132de2",
                "fraction": 0.5,
                "aliquot_type": "RNA+P"
            },
            {
                "source_uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                "target_uuid": "36bb5bd0-7f57-0130-e345-282066132de2",
                "fraction": 0.5,
                "aliquot_type": "RNA+P"
            }
        ]
    }
}
    EOD

  # Change the status of the binding_spin_column_dna to done. Change the status of the by_product_tube to done. Change the status of the tube_to_be_extracted to unused


    response = put "/2ea9d600-7f57-0130-e344-282066132de2", <<-EOD
    {
    "items": {
        "binding_spin_column_dna": {
            "362fbaa0-7f57-0130-e345-282066132de2": {
                "event": "complete"
            },
            "365fd5b0-7f57-0130-e345-282066132de2": {
                "event": "complete"
            }
        },
        "by_product_tube_rnap": {
            "368d90c0-7f57-0130-e345-282066132de2": {
                "event": "complete"
            },
            "36bb5bd0-7f57-0130-e345-282066132de2": {
                "event": "complete"
            }
        },
        "binding_tube_to_be_extracted_nap": {
            "2ea58a10-7f57-0130-e344-282066132de2": {
                "event": "unuse"
            },
            "2ea6d7b0-7f57-0130-e344-282066132de2": {
                "event": "unuse"
            }
        }
    },
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2"
        },
        "uuid": "2ea9d600-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "in_progress",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_dna": [
                {
                    "uuid": "362fbaa0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "365fd5b0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "by_product_tube_rnap": [
                {
                    "uuid": "368d90c0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "36bb5bd0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ]
        }
    }
}
    EOD



  # Create new spin columns


    response = post "/spin_columns", <<-EOD
    {
    "spin_column": {
        "user": "username"
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "spin_column": {
        "actions": {
            "read": "http://example.org/3bb68680-7f57-0130-e345-282066132de2",
            "create": "http://example.org/3bb68680-7f57-0130-e345-282066132de2",
            "update": "http://example.org/3bb68680-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/3bb68680-7f57-0130-e345-282066132de2"
        },
        "uuid": "3bb68680-7f57-0130-e345-282066132de2",
        "aliquots": [

        ]
    }
}
    EOD



    response = post "/labellables", <<-EOD
    {
    "labellable": {
        "user": "username",
        "name": "3bb68680-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567891500",
                "type": "ean13-barcode"
            }
        }
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "labellable": {
        "actions": {
            "read": "http://example.org/3bc66470-7f57-0130-e345-282066132de2",
            "create": "http://example.org/3bc66470-7f57-0130-e345-282066132de2",
            "update": "http://example.org/3bc66470-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/3bc66470-7f57-0130-e345-282066132de2"
        },
        "uuid": "3bc66470-7f57-0130-e345-282066132de2",
        "name": "3bb68680-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567891500",
                "type": "ean13-barcode"
            }
        }
    }
}
    EOD

  # Create new tubes 


    response = post "/tubes", <<-EOD
    {
    "tube": {
        "user": "username"
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "tube": {
        "actions": {
            "read": "http://example.org/3be83770-7f57-0130-e345-282066132de2",
            "create": "http://example.org/3be83770-7f57-0130-e345-282066132de2",
            "update": "http://example.org/3be83770-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/3be83770-7f57-0130-e345-282066132de2"
        },
        "uuid": "3be83770-7f57-0130-e345-282066132de2",
        "type": null,
        "max_volume": null,
        "aliquots": [

        ]
    }
}
    EOD



    response = post "/labellables", <<-EOD
    {
    "labellable": {
        "user": "username",
        "name": "3be83770-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567891600",
                "type": "ean13-barcode"
            }
        }
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "labellable": {
        "actions": {
            "read": "http://example.org/3bf17180-7f57-0130-e345-282066132de2",
            "create": "http://example.org/3bf17180-7f57-0130-e345-282066132de2",
            "update": "http://example.org/3bf17180-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/3bf17180-7f57-0130-e345-282066132de2"
        },
        "uuid": "3bf17180-7f57-0130-e345-282066132de2",
        "name": "3be83770-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567891600",
                "type": "ean13-barcode"
            }
        }
    }
}
    EOD

  # Add the new spin columns and new tubes in the order and start each of them


    response = put "/2eaaf660-7f57-0130-e344-282066132de2", <<-EOD
    {
    "items": {
        "binding_spin_column_dna": {
            "3bb68680-7f57-0130-e345-282066132de2": {
                "event": "start",
                "batch_uuid": "34a52320-7f57-0130-e345-282066132de2"
            }
        },
        "by_product_tube_rnap": {
            "3be83770-7f57-0130-e345-282066132de2": {
                "event": "start",
                "batch_uuid": "34a52320-7f57-0130-e345-282066132de2"
            }
        }
    },
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2"
        },
        "uuid": "2eaaf660-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "in_progress",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_dna": [
                {
                    "uuid": "3bb68680-7f57-0130-e345-282066132de2",
                    "status": "in_progress",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "by_product_tube_rnap": [
                {
                    "uuid": "3be83770-7f57-0130-e345-282066132de2",
                    "status": "in_progress",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ]
        }
    }
}
    EOD

  # Transfers from tube_to_be_extracted into binding_spin_column_dna spins and into by_product_tube tubes.


    response = post "/actions/transfer_tubes_to_tubes", <<-EOD
    {
    "transfer_tubes_to_tubes": {
        "user": "username",
        "transfers": [
            {
                "source_uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                "target_uuid": "3bb68680-7f57-0130-e345-282066132de2",
                "fraction": 0.5,
                "aliquot_type": "DNA"
            },
            {
                "source_uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                "target_uuid": "3be83770-7f57-0130-e345-282066132de2",
                "fraction": 0.5,
                "aliquot_type": "RNA+P"
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
        "user": "username",
        "application": "application",
        "result": {
            "sources": [
                {
                    "tube": {
                        "actions": {
                            "read": "http://example.org/2ea83c50-7f57-0130-e344-282066132de2",
                            "create": "http://example.org/2ea83c50-7f57-0130-e344-282066132de2",
                            "update": "http://example.org/2ea83c50-7f57-0130-e344-282066132de2",
                            "delete": "http://example.org/2ea83c50-7f57-0130-e344-282066132de2"
                        },
                        "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                        "type": null,
                        "max_volume": null,
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea4b420-7f57-0130-e344-282066132de2",
                                    "name": "sample_2"
                                },
                                "quantity": 1000,
                                "type": "NA+P",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/2ea84ed0-7f57-0130-e344-282066132de2",
                                "create": "http://example.org/2ea84ed0-7f57-0130-e344-282066132de2",
                                "update": "http://example.org/2ea84ed0-7f57-0130-e344-282066132de2",
                                "delete": "http://example.org/2ea84ed0-7f57-0130-e344-282066132de2"
                            },
                            "uuid": "2ea84ed0-7f57-0130-e344-282066132de2",
                            "barcode": {
                                "value": "1220017279669",
                                "type": "ean13-barcode"
                            }
                        }
                    }
                }
            ],
            "targets": [
                {
                    "spin_column": {
                        "actions": {
                            "read": "http://example.org/3bb68680-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/3bb68680-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/3bb68680-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/3bb68680-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "3bb68680-7f57-0130-e345-282066132de2",
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea4b420-7f57-0130-e344-282066132de2",
                                    "name": "sample_2"
                                },
                                "type": "DNA",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/3bc66470-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/3bc66470-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/3bc66470-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/3bc66470-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "3bc66470-7f57-0130-e345-282066132de2",
                            "barcode": {
                                "value": "1234567891500",
                                "type": "ean13-barcode"
                            }
                        }
                    }
                },
                {
                    "tube": {
                        "actions": {
                            "read": "http://example.org/3be83770-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/3be83770-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/3be83770-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/3be83770-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "3be83770-7f57-0130-e345-282066132de2",
                        "type": null,
                        "max_volume": null,
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea4b420-7f57-0130-e344-282066132de2",
                                    "name": "sample_2"
                                },
                                "type": "RNA+P",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/3bf17180-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/3bf17180-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/3bf17180-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/3bf17180-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "3bf17180-7f57-0130-e345-282066132de2",
                            "barcode": {
                                "value": "1234567891600",
                                "type": "ean13-barcode"
                            }
                        }
                    }
                }
            ]
        },
        "transfers": [
            {
                "source_uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                "target_uuid": "3bb68680-7f57-0130-e345-282066132de2",
                "fraction": 0.5,
                "aliquot_type": "DNA"
            },
            {
                "source_uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                "target_uuid": "3be83770-7f57-0130-e345-282066132de2",
                "fraction": 0.5,
                "aliquot_type": "RNA+P"
            }
        ]
    }
}
    EOD

  # Change the status of the binding_spin_column_dna to done. Change the status of the by_product_tube to done. Change the status of the tube_to_be_extracted to unused


    response = put "/2eaaf660-7f57-0130-e344-282066132de2", <<-EOD
    {
    "items": {
        "binding_spin_column_dna": {
            "3bb68680-7f57-0130-e345-282066132de2": {
                "event": "complete"
            }
        },
        "by_product_tube_rnap": {
            "3be83770-7f57-0130-e345-282066132de2": {
                "event": "complete"
            }
        },
        "binding_tube_to_be_extracted_nap": {
            "2ea83c50-7f57-0130-e344-282066132de2": {
                "event": "unuse"
            }
        }
    },
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2"
        },
        "uuid": "2eaaf660-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "in_progress",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_dna": [
                {
                    "uuid": "3bb68680-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "by_product_tube_rnap": [
                {
                    "uuid": "3be83770-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ]
        }
    }
}
    EOD



  # Create new tubes 


    response = post "/tubes", <<-EOD
    {
    "tube": {
        "user": "username"
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "tube": {
        "actions": {
            "read": "http://example.org/37669990-7f57-0130-e345-282066132de2",
            "create": "http://example.org/37669990-7f57-0130-e345-282066132de2",
            "update": "http://example.org/37669990-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/37669990-7f57-0130-e345-282066132de2"
        },
        "uuid": "37669990-7f57-0130-e345-282066132de2",
        "type": null,
        "max_volume": null,
        "aliquots": [

        ]
    }
}
    EOD



    response = post "/labellables", <<-EOD
    {
    "labellable": {
        "user": "username",
        "name": "37669990-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567895000",
                "type": "ean13-barcode"
            }
        }
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "labellable": {
        "actions": {
            "read": "http://example.org/37795ee0-7f57-0130-e345-282066132de2",
            "create": "http://example.org/37795ee0-7f57-0130-e345-282066132de2",
            "update": "http://example.org/37795ee0-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/37795ee0-7f57-0130-e345-282066132de2"
        },
        "uuid": "37795ee0-7f57-0130-e345-282066132de2",
        "name": "37669990-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567895000",
                "type": "ean13-barcode"
            }
        }
    }
}
    EOD



    response = post "/tubes", <<-EOD
    {
    "tube": {
        "user": "username"
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "tube": {
        "actions": {
            "read": "http://example.org/37a563a0-7f57-0130-e345-282066132de2",
            "create": "http://example.org/37a563a0-7f57-0130-e345-282066132de2",
            "update": "http://example.org/37a563a0-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/37a563a0-7f57-0130-e345-282066132de2"
        },
        "uuid": "37a563a0-7f57-0130-e345-282066132de2",
        "type": null,
        "max_volume": null,
        "aliquots": [

        ]
    }
}
    EOD



    response = post "/labellables", <<-EOD
    {
    "labellable": {
        "user": "username",
        "name": "37a563a0-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567896000",
                "type": "ean13-barcode"
            }
        }
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "labellable": {
        "actions": {
            "read": "http://example.org/37b7e9e0-7f57-0130-e345-282066132de2",
            "create": "http://example.org/37b7e9e0-7f57-0130-e345-282066132de2",
            "update": "http://example.org/37b7e9e0-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/37b7e9e0-7f57-0130-e345-282066132de2"
        },
        "uuid": "37b7e9e0-7f57-0130-e345-282066132de2",
        "name": "37a563a0-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567896000",
                "type": "ean13-barcode"
            }
        }
    }
}
    EOD

  # Add the extracted_dna_tube in the order and start them


    response = put "/2ea9d600-7f57-0130-e344-282066132de2", <<-EOD
    {
    "items": {
        "extracted_tube_dna": {
            "37669990-7f57-0130-e345-282066132de2": {
                "event": "start",
                "batch_uuid": "34a52320-7f57-0130-e345-282066132de2"
            },
            "37a563a0-7f57-0130-e345-282066132de2": {
                "event": "start",
                "batch_uuid": "34a52320-7f57-0130-e345-282066132de2"
            }
        }
    },
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2"
        },
        "uuid": "2ea9d600-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "in_progress",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_dna": [
                {
                    "uuid": "362fbaa0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "365fd5b0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "by_product_tube_rnap": [
                {
                    "uuid": "368d90c0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "36bb5bd0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_dna": [
                {
                    "uuid": "37669990-7f57-0130-e345-282066132de2",
                    "status": "in_progress",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "37a563a0-7f57-0130-e345-282066132de2",
                    "status": "in_progress",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ]
        }
    }
}
    EOD

  # Transfer binding_spin_column_dna into extracted_tube


    response = post "/actions/transfer_tubes_to_tubes", <<-EOD
    {
    "transfer_tubes_to_tubes": {
        "user": "username",
        "transfers": [
            {
                "source_uuid": "362fbaa0-7f57-0130-e345-282066132de2",
                "target_uuid": "37669990-7f57-0130-e345-282066132de2",
                "fraction": 1,
                "aliquot_type": null
            },
            {
                "source_uuid": "365fd5b0-7f57-0130-e345-282066132de2",
                "target_uuid": "37a563a0-7f57-0130-e345-282066132de2",
                "fraction": 1,
                "aliquot_type": null
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
        "user": "username",
        "application": "application",
        "result": {
            "sources": [
                {
                    "spin_column": {
                        "actions": {
                            "read": "http://example.org/362fbaa0-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/362fbaa0-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/362fbaa0-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/362fbaa0-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "362fbaa0-7f57-0130-e345-282066132de2",
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea393c0-7f57-0130-e344-282066132de2",
                                    "name": "sample_0"
                                },
                                "type": "DNA",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/36437e60-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/36437e60-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/36437e60-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/36437e60-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "36437e60-7f57-0130-e345-282066132de2",
                            "barcode": {
                                "value": "1234567891000",
                                "type": "ean13-barcode"
                            }
                        }
                    }
                },
                {
                    "spin_column": {
                        "actions": {
                            "read": "http://example.org/365fd5b0-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/365fd5b0-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/365fd5b0-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/365fd5b0-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "365fd5b0-7f57-0130-e345-282066132de2",
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea423b0-7f57-0130-e344-282066132de2",
                                    "name": "sample_1"
                                },
                                "type": "DNA",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/36761180-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/36761180-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/36761180-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/36761180-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "36761180-7f57-0130-e345-282066132de2",
                            "barcode": {
                                "value": "1234567892000",
                                "type": "ean13-barcode"
                            }
                        }
                    }
                }
            ],
            "targets": [
                {
                    "tube": {
                        "actions": {
                            "read": "http://example.org/37669990-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/37669990-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/37669990-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/37669990-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "37669990-7f57-0130-e345-282066132de2",
                        "type": null,
                        "max_volume": null,
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea393c0-7f57-0130-e344-282066132de2",
                                    "name": "sample_0"
                                },
                                "type": "DNA",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/37795ee0-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/37795ee0-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/37795ee0-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/37795ee0-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "37795ee0-7f57-0130-e345-282066132de2",
                            "barcode": {
                                "value": "1234567895000",
                                "type": "ean13-barcode"
                            }
                        }
                    }
                },
                {
                    "tube": {
                        "actions": {
                            "read": "http://example.org/37a563a0-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/37a563a0-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/37a563a0-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/37a563a0-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "37a563a0-7f57-0130-e345-282066132de2",
                        "type": null,
                        "max_volume": null,
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea423b0-7f57-0130-e344-282066132de2",
                                    "name": "sample_1"
                                },
                                "type": "DNA",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/37b7e9e0-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/37b7e9e0-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/37b7e9e0-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/37b7e9e0-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "37b7e9e0-7f57-0130-e345-282066132de2",
                            "barcode": {
                                "value": "1234567896000",
                                "type": "ean13-barcode"
                            }
                        }
                    }
                }
            ]
        },
        "transfers": [
            {
                "source_uuid": "362fbaa0-7f57-0130-e345-282066132de2",
                "target_uuid": "37669990-7f57-0130-e345-282066132de2",
                "fraction": 1,
                "aliquot_type": null
            },
            {
                "source_uuid": "365fd5b0-7f57-0130-e345-282066132de2",
                "target_uuid": "37a563a0-7f57-0130-e345-282066132de2",
                "fraction": 1,
                "aliquot_type": null
            }
        ]
    }
}
    EOD

  # Change the status of extracted_tube tubes to done. Change the status of binding_spin_column_dna to unused


    response = put "/2ea9d600-7f57-0130-e344-282066132de2", <<-EOD
    {
    "items": {
        "extracted_tube_dna": {
            "37669990-7f57-0130-e345-282066132de2": {
                "event": "complete"
            },
            "37a563a0-7f57-0130-e345-282066132de2": {
                "event": "complete"
            }
        },
        "binding_spin_column_dna": {
            "362fbaa0-7f57-0130-e345-282066132de2": {
                "event": "unuse"
            },
            "365fd5b0-7f57-0130-e345-282066132de2": {
                "event": "unuse"
            }
        }
    },
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2"
        },
        "uuid": "2ea9d600-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "in_progress",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_dna": [
                {
                    "uuid": "362fbaa0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "365fd5b0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "by_product_tube_rnap": [
                {
                    "uuid": "368d90c0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "36bb5bd0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_dna": [
                {
                    "uuid": "37669990-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "37a563a0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ]
        }
    }
}
    EOD



  # Create new tubes 


    response = post "/tubes", <<-EOD
    {
    "tube": {
        "user": "username"
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "tube": {
        "actions": {
            "read": "http://example.org/3c744720-7f57-0130-e345-282066132de2",
            "create": "http://example.org/3c744720-7f57-0130-e345-282066132de2",
            "update": "http://example.org/3c744720-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/3c744720-7f57-0130-e345-282066132de2"
        },
        "uuid": "3c744720-7f57-0130-e345-282066132de2",
        "type": null,
        "max_volume": null,
        "aliquots": [

        ]
    }
}
    EOD



    response = post "/labellables", <<-EOD
    {
    "labellable": {
        "user": "username",
        "name": "3c744720-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567891700",
                "type": "ean13-barcode"
            }
        }
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "labellable": {
        "actions": {
            "read": "http://example.org/3c899370-7f57-0130-e345-282066132de2",
            "create": "http://example.org/3c899370-7f57-0130-e345-282066132de2",
            "update": "http://example.org/3c899370-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/3c899370-7f57-0130-e345-282066132de2"
        },
        "uuid": "3c899370-7f57-0130-e345-282066132de2",
        "name": "3c744720-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567891700",
                "type": "ean13-barcode"
            }
        }
    }
}
    EOD

  # Add the extracted_dna_tube in the order and start them


    response = put "/2eaaf660-7f57-0130-e344-282066132de2", <<-EOD
    {
    "items": {
        "extracted_tube_dna": {
            "3c744720-7f57-0130-e345-282066132de2": {
                "event": "start",
                "batch_uuid": "34a52320-7f57-0130-e345-282066132de2"
            }
        }
    },
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2"
        },
        "uuid": "2eaaf660-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "in_progress",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_dna": [
                {
                    "uuid": "3bb68680-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "by_product_tube_rnap": [
                {
                    "uuid": "3be83770-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_dna": [
                {
                    "uuid": "3c744720-7f57-0130-e345-282066132de2",
                    "status": "in_progress",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ]
        }
    }
}
    EOD

  # Transfer binding_spin_column_dna into extracted_tube


    response = post "/actions/transfer_tubes_to_tubes", <<-EOD
    {
    "transfer_tubes_to_tubes": {
        "user": "username",
        "transfers": [
            {
                "source_uuid": "3bb68680-7f57-0130-e345-282066132de2",
                "target_uuid": "3c744720-7f57-0130-e345-282066132de2",
                "fraction": 1,
                "aliquot_type": null
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
        "user": "username",
        "application": "application",
        "result": {
            "sources": [
                {
                    "spin_column": {
                        "actions": {
                            "read": "http://example.org/3bb68680-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/3bb68680-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/3bb68680-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/3bb68680-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "3bb68680-7f57-0130-e345-282066132de2",
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea4b420-7f57-0130-e344-282066132de2",
                                    "name": "sample_2"
                                },
                                "type": "DNA",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/3bc66470-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/3bc66470-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/3bc66470-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/3bc66470-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "3bc66470-7f57-0130-e345-282066132de2",
                            "barcode": {
                                "value": "1234567891500",
                                "type": "ean13-barcode"
                            }
                        }
                    }
                }
            ],
            "targets": [
                {
                    "tube": {
                        "actions": {
                            "read": "http://example.org/3c744720-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/3c744720-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/3c744720-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/3c744720-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "3c744720-7f57-0130-e345-282066132de2",
                        "type": null,
                        "max_volume": null,
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea4b420-7f57-0130-e344-282066132de2",
                                    "name": "sample_2"
                                },
                                "type": "DNA",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/3c899370-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/3c899370-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/3c899370-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/3c899370-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "3c899370-7f57-0130-e345-282066132de2",
                            "barcode": {
                                "value": "1234567891700",
                                "type": "ean13-barcode"
                            }
                        }
                    }
                }
            ]
        },
        "transfers": [
            {
                "source_uuid": "3bb68680-7f57-0130-e345-282066132de2",
                "target_uuid": "3c744720-7f57-0130-e345-282066132de2",
                "fraction": 1,
                "aliquot_type": null
            }
        ]
    }
}
    EOD

  # Change the status of extracted_tube tubes to done. Change the status of binding_spin_column_dna to unused


    response = put "/2eaaf660-7f57-0130-e344-282066132de2", <<-EOD
    {
    "items": {
        "extracted_tube_dna": {
            "3c744720-7f57-0130-e345-282066132de2": {
                "event": "complete"
            }
        },
        "binding_spin_column_dna": {
            "3bb68680-7f57-0130-e345-282066132de2": {
                "event": "unuse"
            }
        }
    },
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2"
        },
        "uuid": "2eaaf660-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "in_progress",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_dna": [
                {
                    "uuid": "3bb68680-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "by_product_tube_rnap": [
                {
                    "uuid": "3be83770-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_dna": [
                {
                    "uuid": "3c744720-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ]
        }
    }
}
    EOD



  # Create new tubes 


    response = post "/tubes", <<-EOD
    {
    "tube": {
        "user": "username"
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "tube": {
        "actions": {
            "read": "http://example.org/38343460-7f57-0130-e345-282066132de2",
            "create": "http://example.org/38343460-7f57-0130-e345-282066132de2",
            "update": "http://example.org/38343460-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/38343460-7f57-0130-e345-282066132de2"
        },
        "uuid": "38343460-7f57-0130-e345-282066132de2",
        "type": null,
        "max_volume": null,
        "aliquots": [

        ]
    }
}
    EOD



    response = post "/labellables", <<-EOD
    {
    "labellable": {
        "user": "username",
        "name": "38343460-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567897000",
                "type": "ean13-barcode"
            }
        }
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "labellable": {
        "actions": {
            "read": "http://example.org/384d3fa0-7f57-0130-e345-282066132de2",
            "create": "http://example.org/384d3fa0-7f57-0130-e345-282066132de2",
            "update": "http://example.org/384d3fa0-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/384d3fa0-7f57-0130-e345-282066132de2"
        },
        "uuid": "384d3fa0-7f57-0130-e345-282066132de2",
        "name": "38343460-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567897000",
                "type": "ean13-barcode"
            }
        }
    }
}
    EOD



    response = post "/tubes", <<-EOD
    {
    "tube": {
        "user": "username"
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "tube": {
        "actions": {
            "read": "http://example.org/38791c40-7f57-0130-e345-282066132de2",
            "create": "http://example.org/38791c40-7f57-0130-e345-282066132de2",
            "update": "http://example.org/38791c40-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/38791c40-7f57-0130-e345-282066132de2"
        },
        "uuid": "38791c40-7f57-0130-e345-282066132de2",
        "type": null,
        "max_volume": null,
        "aliquots": [

        ]
    }
}
    EOD



    response = post "/labellables", <<-EOD
    {
    "labellable": {
        "user": "username",
        "name": "38791c40-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567898000",
                "type": "ean13-barcode"
            }
        }
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "labellable": {
        "actions": {
            "read": "http://example.org/38946f40-7f57-0130-e345-282066132de2",
            "create": "http://example.org/38946f40-7f57-0130-e345-282066132de2",
            "update": "http://example.org/38946f40-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/38946f40-7f57-0130-e345-282066132de2"
        },
        "uuid": "38946f40-7f57-0130-e345-282066132de2",
        "name": "38791c40-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567898000",
                "type": "ean13-barcode"
            }
        }
    }
}
    EOD

  # Add tube_to_be_extracted tubes in the order and start them.


    response = put "/2ea9d600-7f57-0130-e344-282066132de2", <<-EOD
    {
    "items": {
        "tube_to_be_extracted_rnap": {
            "38343460-7f57-0130-e345-282066132de2": {
                "event": "start",
                "batch_uuid": "34a52320-7f57-0130-e345-282066132de2"
            },
            "38791c40-7f57-0130-e345-282066132de2": {
                "event": "start",
                "batch_uuid": "34a52320-7f57-0130-e345-282066132de2"
            }
        }
    },
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2"
        },
        "uuid": "2ea9d600-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "in_progress",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_dna": [
                {
                    "uuid": "362fbaa0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "365fd5b0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "by_product_tube_rnap": [
                {
                    "uuid": "368d90c0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "36bb5bd0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_dna": [
                {
                    "uuid": "37669990-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "37a563a0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "tube_to_be_extracted_rnap": [
                {
                    "uuid": "38343460-7f57-0130-e345-282066132de2",
                    "status": "in_progress",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "38791c40-7f57-0130-e345-282066132de2",
                    "status": "in_progress",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ]
        }
    }
}
    EOD

  # Transfer from by_product_tube tubes into tube_to_be_extracted tubes


    response = post "/actions/transfer_tubes_to_tubes", <<-EOD
    {
    "transfer_tubes_to_tubes": {
        "user": "username",
        "transfers": [
            {
                "source_uuid": "368d90c0-7f57-0130-e345-282066132de2",
                "target_uuid": "38343460-7f57-0130-e345-282066132de2",
                "fraction": 1,
                "aliquot_type": null
            },
            {
                "source_uuid": "36bb5bd0-7f57-0130-e345-282066132de2",
                "target_uuid": "38791c40-7f57-0130-e345-282066132de2",
                "fraction": 1,
                "aliquot_type": null
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
        "user": "username",
        "application": "application",
        "result": {
            "sources": [
                {
                    "tube": {
                        "actions": {
                            "read": "http://example.org/368d90c0-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/368d90c0-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/368d90c0-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/368d90c0-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "368d90c0-7f57-0130-e345-282066132de2",
                        "type": null,
                        "max_volume": null,
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea393c0-7f57-0130-e344-282066132de2",
                                    "name": "sample_0"
                                },
                                "type": "RNA+P",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/36a3d7a0-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/36a3d7a0-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/36a3d7a0-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/36a3d7a0-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "36a3d7a0-7f57-0130-e345-282066132de2",
                            "barcode": {
                                "value": "1234567893000",
                                "type": "ean13-barcode"
                            }
                        }
                    }
                },
                {
                    "tube": {
                        "actions": {
                            "read": "http://example.org/36bb5bd0-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/36bb5bd0-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/36bb5bd0-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/36bb5bd0-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "36bb5bd0-7f57-0130-e345-282066132de2",
                        "type": null,
                        "max_volume": null,
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea423b0-7f57-0130-e344-282066132de2",
                                    "name": "sample_1"
                                },
                                "type": "RNA+P",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/36cfea70-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/36cfea70-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/36cfea70-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/36cfea70-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "36cfea70-7f57-0130-e345-282066132de2",
                            "barcode": {
                                "value": "1234567894000",
                                "type": "ean13-barcode"
                            }
                        }
                    }
                }
            ],
            "targets": [
                {
                    "tube": {
                        "actions": {
                            "read": "http://example.org/38343460-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/38343460-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/38343460-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/38343460-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "38343460-7f57-0130-e345-282066132de2",
                        "type": null,
                        "max_volume": null,
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea393c0-7f57-0130-e344-282066132de2",
                                    "name": "sample_0"
                                },
                                "type": "RNA+P",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/384d3fa0-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/384d3fa0-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/384d3fa0-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/384d3fa0-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "384d3fa0-7f57-0130-e345-282066132de2",
                            "barcode": {
                                "value": "1234567897000",
                                "type": "ean13-barcode"
                            }
                        }
                    }
                },
                {
                    "tube": {
                        "actions": {
                            "read": "http://example.org/38791c40-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/38791c40-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/38791c40-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/38791c40-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "38791c40-7f57-0130-e345-282066132de2",
                        "type": null,
                        "max_volume": null,
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea423b0-7f57-0130-e344-282066132de2",
                                    "name": "sample_1"
                                },
                                "type": "RNA+P",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/38946f40-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/38946f40-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/38946f40-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/38946f40-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "38946f40-7f57-0130-e345-282066132de2",
                            "barcode": {
                                "value": "1234567898000",
                                "type": "ean13-barcode"
                            }
                        }
                    }
                }
            ]
        },
        "transfers": [
            {
                "source_uuid": "368d90c0-7f57-0130-e345-282066132de2",
                "target_uuid": "38343460-7f57-0130-e345-282066132de2",
                "fraction": 1,
                "aliquot_type": null
            },
            {
                "source_uuid": "36bb5bd0-7f57-0130-e345-282066132de2",
                "target_uuid": "38791c40-7f57-0130-e345-282066132de2",
                "fraction": 1,
                "aliquot_type": null
            }
        ]
    }
}
    EOD

  # Change the status of by_product_tube to done. Change the status of tube_to_be_extracted to done


    response = put "/2ea9d600-7f57-0130-e344-282066132de2", <<-EOD
    {
    "items": {
        "tube_to_be_extracted_rnap": {
            "38343460-7f57-0130-e345-282066132de2": {
                "event": "complete"
            },
            "38791c40-7f57-0130-e345-282066132de2": {
                "event": "complete"
            }
        },
        "by_product_tube_rnap": {
            "368d90c0-7f57-0130-e345-282066132de2": {
                "event": "unuse"
            },
            "36bb5bd0-7f57-0130-e345-282066132de2": {
                "event": "unuse"
            }
        }
    },
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2"
        },
        "uuid": "2ea9d600-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "in_progress",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_dna": [
                {
                    "uuid": "362fbaa0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "365fd5b0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "by_product_tube_rnap": [
                {
                    "uuid": "368d90c0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "36bb5bd0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_dna": [
                {
                    "uuid": "37669990-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "37a563a0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "tube_to_be_extracted_rnap": [
                {
                    "uuid": "38343460-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "38791c40-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ]
        }
    }
}
    EOD



  # Create new tubes 


    response = post "/tubes", <<-EOD
    {
    "tube": {
        "user": "username"
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "tube": {
        "actions": {
            "read": "http://example.org/3d0b15d0-7f57-0130-e345-282066132de2",
            "create": "http://example.org/3d0b15d0-7f57-0130-e345-282066132de2",
            "update": "http://example.org/3d0b15d0-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/3d0b15d0-7f57-0130-e345-282066132de2"
        },
        "uuid": "3d0b15d0-7f57-0130-e345-282066132de2",
        "type": null,
        "max_volume": null,
        "aliquots": [

        ]
    }
}
    EOD



    response = post "/labellables", <<-EOD
    {
    "labellable": {
        "user": "username",
        "name": "3d0b15d0-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567891800",
                "type": "ean13-barcode"
            }
        }
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "labellable": {
        "actions": {
            "read": "http://example.org/3d2054f0-7f57-0130-e345-282066132de2",
            "create": "http://example.org/3d2054f0-7f57-0130-e345-282066132de2",
            "update": "http://example.org/3d2054f0-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/3d2054f0-7f57-0130-e345-282066132de2"
        },
        "uuid": "3d2054f0-7f57-0130-e345-282066132de2",
        "name": "3d0b15d0-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567891800",
                "type": "ean13-barcode"
            }
        }
    }
}
    EOD

  # Add tube_to_be_extracted tubes in the order and start them.


    response = put "/2eaaf660-7f57-0130-e344-282066132de2", <<-EOD
    {
    "items": {
        "tube_to_be_extracted_rnap": {
            "3d0b15d0-7f57-0130-e345-282066132de2": {
                "event": "start",
                "batch_uuid": "34a52320-7f57-0130-e345-282066132de2"
            }
        }
    },
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2"
        },
        "uuid": "2eaaf660-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "in_progress",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_dna": [
                {
                    "uuid": "3bb68680-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "by_product_tube_rnap": [
                {
                    "uuid": "3be83770-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_dna": [
                {
                    "uuid": "3c744720-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "tube_to_be_extracted_rnap": [
                {
                    "uuid": "3d0b15d0-7f57-0130-e345-282066132de2",
                    "status": "in_progress",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ]
        }
    }
}
    EOD

  # Transfer from by_product_tube tubes into tube_to_be_extracted tubes


    response = post "/actions/transfer_tubes_to_tubes", <<-EOD
    {
    "transfer_tubes_to_tubes": {
        "user": "username",
        "transfers": [
            {
                "source_uuid": "3be83770-7f57-0130-e345-282066132de2",
                "target_uuid": "3d0b15d0-7f57-0130-e345-282066132de2",
                "fraction": 1,
                "aliquot_type": null
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
        "user": "username",
        "application": "application",
        "result": {
            "sources": [
                {
                    "tube": {
                        "actions": {
                            "read": "http://example.org/3be83770-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/3be83770-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/3be83770-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/3be83770-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "3be83770-7f57-0130-e345-282066132de2",
                        "type": null,
                        "max_volume": null,
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea4b420-7f57-0130-e344-282066132de2",
                                    "name": "sample_2"
                                },
                                "type": "RNA+P",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/3bf17180-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/3bf17180-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/3bf17180-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/3bf17180-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "3bf17180-7f57-0130-e345-282066132de2",
                            "barcode": {
                                "value": "1234567891600",
                                "type": "ean13-barcode"
                            }
                        }
                    }
                }
            ],
            "targets": [
                {
                    "tube": {
                        "actions": {
                            "read": "http://example.org/3d0b15d0-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/3d0b15d0-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/3d0b15d0-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/3d0b15d0-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "3d0b15d0-7f57-0130-e345-282066132de2",
                        "type": null,
                        "max_volume": null,
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea4b420-7f57-0130-e344-282066132de2",
                                    "name": "sample_2"
                                },
                                "type": "RNA+P",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/3d2054f0-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/3d2054f0-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/3d2054f0-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/3d2054f0-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "3d2054f0-7f57-0130-e345-282066132de2",
                            "barcode": {
                                "value": "1234567891800",
                                "type": "ean13-barcode"
                            }
                        }
                    }
                }
            ]
        },
        "transfers": [
            {
                "source_uuid": "3be83770-7f57-0130-e345-282066132de2",
                "target_uuid": "3d0b15d0-7f57-0130-e345-282066132de2",
                "fraction": 1,
                "aliquot_type": null
            }
        ]
    }
}
    EOD

  # Change the status of by_product_tube to done. Change the status of tube_to_be_extracted to done


    response = put "/2eaaf660-7f57-0130-e344-282066132de2", <<-EOD
    {
    "items": {
        "tube_to_be_extracted_rnap": {
            "3d0b15d0-7f57-0130-e345-282066132de2": {
                "event": "complete"
            }
        },
        "by_product_tube_rnap": {
            "3be83770-7f57-0130-e345-282066132de2": {
                "event": "unuse"
            }
        }
    },
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2"
        },
        "uuid": "2eaaf660-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "in_progress",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_dna": [
                {
                    "uuid": "3bb68680-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "by_product_tube_rnap": [
                {
                    "uuid": "3be83770-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_dna": [
                {
                    "uuid": "3c744720-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "tube_to_be_extracted_rnap": [
                {
                    "uuid": "3d0b15d0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ]
        }
    }
}
    EOD



  # Create new spin columns


    response = post "/spin_columns", <<-EOD
    {
    "spin_column": {
        "user": "username"
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "spin_column": {
        "actions": {
            "read": "http://example.org/3915b1c0-7f57-0130-e345-282066132de2",
            "create": "http://example.org/3915b1c0-7f57-0130-e345-282066132de2",
            "update": "http://example.org/3915b1c0-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/3915b1c0-7f57-0130-e345-282066132de2"
        },
        "uuid": "3915b1c0-7f57-0130-e345-282066132de2",
        "aliquots": [

        ]
    }
}
    EOD



    response = post "/labellables", <<-EOD
    {
    "labellable": {
        "user": "username",
        "name": "3915b1c0-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567899000",
                "type": "ean13-barcode"
            }
        }
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "labellable": {
        "actions": {
            "read": "http://example.org/392cde50-7f57-0130-e345-282066132de2",
            "create": "http://example.org/392cde50-7f57-0130-e345-282066132de2",
            "update": "http://example.org/392cde50-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/392cde50-7f57-0130-e345-282066132de2"
        },
        "uuid": "392cde50-7f57-0130-e345-282066132de2",
        "name": "3915b1c0-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567899000",
                "type": "ean13-barcode"
            }
        }
    }
}
    EOD



    response = post "/spin_columns", <<-EOD
    {
    "spin_column": {
        "user": "username"
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "spin_column": {
        "actions": {
            "read": "http://example.org/395a39c0-7f57-0130-e345-282066132de2",
            "create": "http://example.org/395a39c0-7f57-0130-e345-282066132de2",
            "update": "http://example.org/395a39c0-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/395a39c0-7f57-0130-e345-282066132de2"
        },
        "uuid": "395a39c0-7f57-0130-e345-282066132de2",
        "aliquots": [

        ]
    }
}
    EOD



    response = post "/labellables", <<-EOD
    {
    "labellable": {
        "user": "username",
        "name": "395a39c0-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567891000",
                "type": "ean13-barcode"
            }
        }
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "labellable": {
        "actions": {
            "read": "http://example.org/396d5db0-7f57-0130-e345-282066132de2",
            "create": "http://example.org/396d5db0-7f57-0130-e345-282066132de2",
            "update": "http://example.org/396d5db0-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/396d5db0-7f57-0130-e345-282066132de2"
        },
        "uuid": "396d5db0-7f57-0130-e345-282066132de2",
        "name": "395a39c0-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567891000",
                "type": "ean13-barcode"
            }
        }
    }
}
    EOD

  # Create new tubes 


    response = post "/tubes", <<-EOD
    {
    "tube": {
        "user": "username"
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "tube": {
        "actions": {
            "read": "http://example.org/397e9f30-7f57-0130-e345-282066132de2",
            "create": "http://example.org/397e9f30-7f57-0130-e345-282066132de2",
            "update": "http://example.org/397e9f30-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/397e9f30-7f57-0130-e345-282066132de2"
        },
        "uuid": "397e9f30-7f57-0130-e345-282066132de2",
        "type": null,
        "max_volume": null,
        "aliquots": [

        ]
    }
}
    EOD



    response = post "/labellables", <<-EOD
    {
    "labellable": {
        "user": "username",
        "name": "397e9f30-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567891100",
                "type": "ean13-barcode"
            }
        }
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "labellable": {
        "actions": {
            "read": "http://example.org/3997d580-7f57-0130-e345-282066132de2",
            "create": "http://example.org/3997d580-7f57-0130-e345-282066132de2",
            "update": "http://example.org/3997d580-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/3997d580-7f57-0130-e345-282066132de2"
        },
        "uuid": "3997d580-7f57-0130-e345-282066132de2",
        "name": "397e9f30-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567891100",
                "type": "ean13-barcode"
            }
        }
    }
}
    EOD



    response = post "/tubes", <<-EOD
    {
    "tube": {
        "user": "username"
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "tube": {
        "actions": {
            "read": "http://example.org/39ac3fc0-7f57-0130-e345-282066132de2",
            "create": "http://example.org/39ac3fc0-7f57-0130-e345-282066132de2",
            "update": "http://example.org/39ac3fc0-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/39ac3fc0-7f57-0130-e345-282066132de2"
        },
        "uuid": "39ac3fc0-7f57-0130-e345-282066132de2",
        "type": null,
        "max_volume": null,
        "aliquots": [

        ]
    }
}
    EOD



    response = post "/labellables", <<-EOD
    {
    "labellable": {
        "user": "username",
        "name": "39ac3fc0-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567891200",
                "type": "ean13-barcode"
            }
        }
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "labellable": {
        "actions": {
            "read": "http://example.org/39c3d4e0-7f57-0130-e345-282066132de2",
            "create": "http://example.org/39c3d4e0-7f57-0130-e345-282066132de2",
            "update": "http://example.org/39c3d4e0-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/39c3d4e0-7f57-0130-e345-282066132de2"
        },
        "uuid": "39c3d4e0-7f57-0130-e345-282066132de2",
        "name": "39ac3fc0-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567891200",
                "type": "ean13-barcode"
            }
        }
    }
}
    EOD

  # Add the new spin columns and new tubes in the order and start each of them


    response = put "/2ea9d600-7f57-0130-e344-282066132de2", <<-EOD
    {
    "items": {
        "binding_spin_column_rna": {
            "3915b1c0-7f57-0130-e345-282066132de2": {
                "event": "start",
                "batch_uuid": "34a52320-7f57-0130-e345-282066132de2"
            },
            "395a39c0-7f57-0130-e345-282066132de2": {
                "event": "start",
                "batch_uuid": "34a52320-7f57-0130-e345-282066132de2"
            }
        },
        "by_product_tube_rnap": {
            "397e9f30-7f57-0130-e345-282066132de2": {
                "event": "start",
                "batch_uuid": "34a52320-7f57-0130-e345-282066132de2"
            },
            "39ac3fc0-7f57-0130-e345-282066132de2": {
                "event": "start",
                "batch_uuid": "34a52320-7f57-0130-e345-282066132de2"
            }
        }
    },
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2"
        },
        "uuid": "2ea9d600-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "in_progress",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_dna": [
                {
                    "uuid": "362fbaa0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "365fd5b0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "by_product_tube_rnap": [
                {
                    "uuid": "368d90c0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "36bb5bd0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "397e9f30-7f57-0130-e345-282066132de2",
                    "status": "in_progress",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "39ac3fc0-7f57-0130-e345-282066132de2",
                    "status": "in_progress",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_dna": [
                {
                    "uuid": "37669990-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "37a563a0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "tube_to_be_extracted_rnap": [
                {
                    "uuid": "38343460-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "38791c40-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_rna": [
                {
                    "uuid": "3915b1c0-7f57-0130-e345-282066132de2",
                    "status": "in_progress",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "395a39c0-7f57-0130-e345-282066132de2",
                    "status": "in_progress",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ]
        }
    }
}
    EOD

  # Transfers from tube_to_be_extracted into binding_spin_column_rna spins and into by_product_tube tubes.


    response = post "/actions/transfer_tubes_to_tubes", <<-EOD
    {
    "transfer_tubes_to_tubes": {
        "user": "username",
        "transfers": [
            {
                "source_uuid": "38343460-7f57-0130-e345-282066132de2",
                "target_uuid": "3915b1c0-7f57-0130-e345-282066132de2",
                "fraction": 0.5,
                "aliquot_type": "RNA"
            },
            {
                "source_uuid": "38791c40-7f57-0130-e345-282066132de2",
                "target_uuid": "395a39c0-7f57-0130-e345-282066132de2",
                "fraction": 0.5,
                "aliquot_type": "RNA"
            },
            {
                "source_uuid": "38343460-7f57-0130-e345-282066132de2",
                "target_uuid": "397e9f30-7f57-0130-e345-282066132de2",
                "fraction": 0.5,
                "aliquot_type": null
            },
            {
                "source_uuid": "38791c40-7f57-0130-e345-282066132de2",
                "target_uuid": "39ac3fc0-7f57-0130-e345-282066132de2",
                "fraction": 0.5,
                "aliquot_type": null
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
        "user": "username",
        "application": "application",
        "result": {
            "sources": [
                {
                    "tube": {
                        "actions": {
                            "read": "http://example.org/38343460-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/38343460-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/38343460-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/38343460-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "38343460-7f57-0130-e345-282066132de2",
                        "type": null,
                        "max_volume": null,
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea393c0-7f57-0130-e344-282066132de2",
                                    "name": "sample_0"
                                },
                                "type": "RNA+P",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/384d3fa0-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/384d3fa0-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/384d3fa0-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/384d3fa0-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "384d3fa0-7f57-0130-e345-282066132de2",
                            "barcode": {
                                "value": "1234567897000",
                                "type": "ean13-barcode"
                            }
                        }
                    }
                },
                {
                    "tube": {
                        "actions": {
                            "read": "http://example.org/38791c40-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/38791c40-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/38791c40-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/38791c40-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "38791c40-7f57-0130-e345-282066132de2",
                        "type": null,
                        "max_volume": null,
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea423b0-7f57-0130-e344-282066132de2",
                                    "name": "sample_1"
                                },
                                "type": "RNA+P",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/38946f40-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/38946f40-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/38946f40-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/38946f40-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "38946f40-7f57-0130-e345-282066132de2",
                            "barcode": {
                                "value": "1234567898000",
                                "type": "ean13-barcode"
                            }
                        }
                    }
                }
            ],
            "targets": [
                {
                    "spin_column": {
                        "actions": {
                            "read": "http://example.org/3915b1c0-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/3915b1c0-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/3915b1c0-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/3915b1c0-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "3915b1c0-7f57-0130-e345-282066132de2",
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea393c0-7f57-0130-e344-282066132de2",
                                    "name": "sample_0"
                                },
                                "type": "RNA",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/392cde50-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/392cde50-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/392cde50-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/392cde50-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "392cde50-7f57-0130-e345-282066132de2",
                            "barcode": {
                                "value": "1234567899000",
                                "type": "ean13-barcode"
                            }
                        }
                    }
                },
                {
                    "spin_column": {
                        "actions": {
                            "read": "http://example.org/395a39c0-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/395a39c0-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/395a39c0-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/395a39c0-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "395a39c0-7f57-0130-e345-282066132de2",
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea423b0-7f57-0130-e344-282066132de2",
                                    "name": "sample_1"
                                },
                                "type": "RNA",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/396d5db0-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/396d5db0-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/396d5db0-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/396d5db0-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "396d5db0-7f57-0130-e345-282066132de2",
                            "barcode": {
                                "value": "1234567891000",
                                "type": "ean13-barcode"
                            }
                        }
                    }
                },
                {
                    "tube": {
                        "actions": {
                            "read": "http://example.org/397e9f30-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/397e9f30-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/397e9f30-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/397e9f30-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "397e9f30-7f57-0130-e345-282066132de2",
                        "type": null,
                        "max_volume": null,
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea393c0-7f57-0130-e344-282066132de2",
                                    "name": "sample_0"
                                },
                                "type": "RNA+P",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/3997d580-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/3997d580-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/3997d580-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/3997d580-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "3997d580-7f57-0130-e345-282066132de2",
                            "barcode": {
                                "value": "1234567891100",
                                "type": "ean13-barcode"
                            }
                        }
                    }
                },
                {
                    "tube": {
                        "actions": {
                            "read": "http://example.org/39ac3fc0-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/39ac3fc0-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/39ac3fc0-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/39ac3fc0-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "39ac3fc0-7f57-0130-e345-282066132de2",
                        "type": null,
                        "max_volume": null,
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea423b0-7f57-0130-e344-282066132de2",
                                    "name": "sample_1"
                                },
                                "type": "RNA+P",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/39c3d4e0-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/39c3d4e0-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/39c3d4e0-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/39c3d4e0-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "39c3d4e0-7f57-0130-e345-282066132de2",
                            "barcode": {
                                "value": "1234567891200",
                                "type": "ean13-barcode"
                            }
                        }
                    }
                }
            ]
        },
        "transfers": [
            {
                "source_uuid": "38343460-7f57-0130-e345-282066132de2",
                "target_uuid": "3915b1c0-7f57-0130-e345-282066132de2",
                "fraction": 0.5,
                "aliquot_type": "RNA"
            },
            {
                "source_uuid": "38791c40-7f57-0130-e345-282066132de2",
                "target_uuid": "395a39c0-7f57-0130-e345-282066132de2",
                "fraction": 0.5,
                "aliquot_type": "RNA"
            },
            {
                "source_uuid": "38343460-7f57-0130-e345-282066132de2",
                "target_uuid": "397e9f30-7f57-0130-e345-282066132de2",
                "fraction": 0.5,
                "aliquot_type": null
            },
            {
                "source_uuid": "38791c40-7f57-0130-e345-282066132de2",
                "target_uuid": "39ac3fc0-7f57-0130-e345-282066132de2",
                "fraction": 0.5,
                "aliquot_type": null
            }
        ]
    }
}
    EOD

  # Change the status of binding_spin_column_rna to done. Change the status of by_product_tube to done. Change the status of tube_to_be_extracted to unused


    response = put "/2ea9d600-7f57-0130-e344-282066132de2", <<-EOD
    {
    "items": {
        "binding_spin_column_rna": {
            "3915b1c0-7f57-0130-e345-282066132de2": {
                "event": "complete"
            },
            "395a39c0-7f57-0130-e345-282066132de2": {
                "event": "complete"
            }
        },
        "by_product_tube_rnap": {
            "397e9f30-7f57-0130-e345-282066132de2": {
                "event": "complete"
            },
            "39ac3fc0-7f57-0130-e345-282066132de2": {
                "event": "complete"
            }
        },
        "tube_to_be_extracted_rnap": {
            "38343460-7f57-0130-e345-282066132de2": {
                "event": "unuse"
            },
            "38791c40-7f57-0130-e345-282066132de2": {
                "event": "unuse"
            }
        }
    },
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2"
        },
        "uuid": "2ea9d600-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "in_progress",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_dna": [
                {
                    "uuid": "362fbaa0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "365fd5b0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "by_product_tube_rnap": [
                {
                    "uuid": "368d90c0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "36bb5bd0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "397e9f30-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "39ac3fc0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_dna": [
                {
                    "uuid": "37669990-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "37a563a0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "tube_to_be_extracted_rnap": [
                {
                    "uuid": "38343460-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "38791c40-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_rna": [
                {
                    "uuid": "3915b1c0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "395a39c0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ]
        }
    }
}
    EOD



  # Create new spin columns


    response = post "/spin_columns", <<-EOD
    {
    "spin_column": {
        "user": "username"
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "spin_column": {
        "actions": {
            "read": "http://example.org/3d9bd4f0-7f57-0130-e345-282066132de2",
            "create": "http://example.org/3d9bd4f0-7f57-0130-e345-282066132de2",
            "update": "http://example.org/3d9bd4f0-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/3d9bd4f0-7f57-0130-e345-282066132de2"
        },
        "uuid": "3d9bd4f0-7f57-0130-e345-282066132de2",
        "aliquots": [

        ]
    }
}
    EOD



    response = post "/labellables", <<-EOD
    {
    "labellable": {
        "user": "username",
        "name": "3d9bd4f0-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567891900",
                "type": "ean13-barcode"
            }
        }
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "labellable": {
        "actions": {
            "read": "http://example.org/3db09950-7f57-0130-e345-282066132de2",
            "create": "http://example.org/3db09950-7f57-0130-e345-282066132de2",
            "update": "http://example.org/3db09950-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/3db09950-7f57-0130-e345-282066132de2"
        },
        "uuid": "3db09950-7f57-0130-e345-282066132de2",
        "name": "3d9bd4f0-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567891900",
                "type": "ean13-barcode"
            }
        }
    }
}
    EOD

  # Create new tubes 


    response = post "/tubes", <<-EOD
    {
    "tube": {
        "user": "username"
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "tube": {
        "actions": {
            "read": "http://example.org/3dc69b90-7f57-0130-e345-282066132de2",
            "create": "http://example.org/3dc69b90-7f57-0130-e345-282066132de2",
            "update": "http://example.org/3dc69b90-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/3dc69b90-7f57-0130-e345-282066132de2"
        },
        "uuid": "3dc69b90-7f57-0130-e345-282066132de2",
        "type": null,
        "max_volume": null,
        "aliquots": [

        ]
    }
}
    EOD



    response = post "/labellables", <<-EOD
    {
    "labellable": {
        "user": "username",
        "name": "3dc69b90-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567892000",
                "type": "ean13-barcode"
            }
        }
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "labellable": {
        "actions": {
            "read": "http://example.org/3ddedb10-7f57-0130-e345-282066132de2",
            "create": "http://example.org/3ddedb10-7f57-0130-e345-282066132de2",
            "update": "http://example.org/3ddedb10-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/3ddedb10-7f57-0130-e345-282066132de2"
        },
        "uuid": "3ddedb10-7f57-0130-e345-282066132de2",
        "name": "3dc69b90-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567892000",
                "type": "ean13-barcode"
            }
        }
    }
}
    EOD

  # Add the new spin columns and new tubes in the order and start each of them


    response = put "/2eaaf660-7f57-0130-e344-282066132de2", <<-EOD
    {
    "items": {
        "binding_spin_column_rna": {
            "3d9bd4f0-7f57-0130-e345-282066132de2": {
                "event": "start",
                "batch_uuid": "34a52320-7f57-0130-e345-282066132de2"
            }
        },
        "by_product_tube_rnap": {
            "3dc69b90-7f57-0130-e345-282066132de2": {
                "event": "start",
                "batch_uuid": "34a52320-7f57-0130-e345-282066132de2"
            }
        }
    },
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2"
        },
        "uuid": "2eaaf660-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "in_progress",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_dna": [
                {
                    "uuid": "3bb68680-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "by_product_tube_rnap": [
                {
                    "uuid": "3be83770-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "3dc69b90-7f57-0130-e345-282066132de2",
                    "status": "in_progress",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_dna": [
                {
                    "uuid": "3c744720-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "tube_to_be_extracted_rnap": [
                {
                    "uuid": "3d0b15d0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_rna": [
                {
                    "uuid": "3d9bd4f0-7f57-0130-e345-282066132de2",
                    "status": "in_progress",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ]
        }
    }
}
    EOD

  # Transfers from tube_to_be_extracted into binding_spin_column_rna spins and into by_product_tube tubes.


    response = post "/actions/transfer_tubes_to_tubes", <<-EOD
    {
    "transfer_tubes_to_tubes": {
        "user": "username",
        "transfers": [
            {
                "source_uuid": "3d0b15d0-7f57-0130-e345-282066132de2",
                "target_uuid": "3d9bd4f0-7f57-0130-e345-282066132de2",
                "fraction": 0.5,
                "aliquot_type": "RNA"
            },
            {
                "source_uuid": "3d0b15d0-7f57-0130-e345-282066132de2",
                "target_uuid": "3dc69b90-7f57-0130-e345-282066132de2",
                "fraction": 0.5,
                "aliquot_type": null
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
        "user": "username",
        "application": "application",
        "result": {
            "sources": [
                {
                    "tube": {
                        "actions": {
                            "read": "http://example.org/3d0b15d0-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/3d0b15d0-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/3d0b15d0-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/3d0b15d0-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "3d0b15d0-7f57-0130-e345-282066132de2",
                        "type": null,
                        "max_volume": null,
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea4b420-7f57-0130-e344-282066132de2",
                                    "name": "sample_2"
                                },
                                "type": "RNA+P",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/3d2054f0-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/3d2054f0-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/3d2054f0-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/3d2054f0-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "3d2054f0-7f57-0130-e345-282066132de2",
                            "barcode": {
                                "value": "1234567891800",
                                "type": "ean13-barcode"
                            }
                        }
                    }
                }
            ],
            "targets": [
                {
                    "spin_column": {
                        "actions": {
                            "read": "http://example.org/3d9bd4f0-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/3d9bd4f0-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/3d9bd4f0-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/3d9bd4f0-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "3d9bd4f0-7f57-0130-e345-282066132de2",
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea4b420-7f57-0130-e344-282066132de2",
                                    "name": "sample_2"
                                },
                                "type": "RNA",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/3db09950-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/3db09950-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/3db09950-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/3db09950-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "3db09950-7f57-0130-e345-282066132de2",
                            "barcode": {
                                "value": "1234567891900",
                                "type": "ean13-barcode"
                            }
                        }
                    }
                },
                {
                    "tube": {
                        "actions": {
                            "read": "http://example.org/3dc69b90-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/3dc69b90-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/3dc69b90-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/3dc69b90-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "3dc69b90-7f57-0130-e345-282066132de2",
                        "type": null,
                        "max_volume": null,
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea4b420-7f57-0130-e344-282066132de2",
                                    "name": "sample_2"
                                },
                                "type": "RNA+P",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/3ddedb10-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/3ddedb10-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/3ddedb10-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/3ddedb10-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "3ddedb10-7f57-0130-e345-282066132de2",
                            "barcode": {
                                "value": "1234567892000",
                                "type": "ean13-barcode"
                            }
                        }
                    }
                }
            ]
        },
        "transfers": [
            {
                "source_uuid": "3d0b15d0-7f57-0130-e345-282066132de2",
                "target_uuid": "3d9bd4f0-7f57-0130-e345-282066132de2",
                "fraction": 0.5,
                "aliquot_type": "RNA"
            },
            {
                "source_uuid": "3d0b15d0-7f57-0130-e345-282066132de2",
                "target_uuid": "3dc69b90-7f57-0130-e345-282066132de2",
                "fraction": 0.5,
                "aliquot_type": null
            }
        ]
    }
}
    EOD

  # Change the status of binding_spin_column_rna to done. Change the status of by_product_tube to done. Change the status of tube_to_be_extracted to unused


    response = put "/2eaaf660-7f57-0130-e344-282066132de2", <<-EOD
    {
    "items": {
        "binding_spin_column_rna": {
            "3d9bd4f0-7f57-0130-e345-282066132de2": {
                "event": "complete"
            }
        },
        "by_product_tube_rnap": {
            "3dc69b90-7f57-0130-e345-282066132de2": {
                "event": "complete"
            }
        },
        "tube_to_be_extracted_rnap": {
            "3d0b15d0-7f57-0130-e345-282066132de2": {
                "event": "unuse"
            }
        }
    },
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2"
        },
        "uuid": "2eaaf660-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "in_progress",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_dna": [
                {
                    "uuid": "3bb68680-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "by_product_tube_rnap": [
                {
                    "uuid": "3be83770-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "3dc69b90-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_dna": [
                {
                    "uuid": "3c744720-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "tube_to_be_extracted_rnap": [
                {
                    "uuid": "3d0b15d0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_rna": [
                {
                    "uuid": "3d9bd4f0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ]
        }
    }
}
    EOD



  # Create new tubes 


    response = post "/tubes", <<-EOD
    {
    "tube": {
        "user": "username"
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "tube": {
        "actions": {
            "read": "http://example.org/3a6019a0-7f57-0130-e345-282066132de2",
            "create": "http://example.org/3a6019a0-7f57-0130-e345-282066132de2",
            "update": "http://example.org/3a6019a0-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/3a6019a0-7f57-0130-e345-282066132de2"
        },
        "uuid": "3a6019a0-7f57-0130-e345-282066132de2",
        "type": null,
        "max_volume": null,
        "aliquots": [

        ]
    }
}
    EOD



    response = post "/labellables", <<-EOD
    {
    "labellable": {
        "user": "username",
        "name": "3a6019a0-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567891300",
                "type": "ean13-barcode"
            }
        }
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "labellable": {
        "actions": {
            "read": "http://example.org/3a6dc620-7f57-0130-e345-282066132de2",
            "create": "http://example.org/3a6dc620-7f57-0130-e345-282066132de2",
            "update": "http://example.org/3a6dc620-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/3a6dc620-7f57-0130-e345-282066132de2"
        },
        "uuid": "3a6dc620-7f57-0130-e345-282066132de2",
        "name": "3a6019a0-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567891300",
                "type": "ean13-barcode"
            }
        }
    }
}
    EOD



    response = post "/tubes", <<-EOD
    {
    "tube": {
        "user": "username"
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "tube": {
        "actions": {
            "read": "http://example.org/3a884ee0-7f57-0130-e345-282066132de2",
            "create": "http://example.org/3a884ee0-7f57-0130-e345-282066132de2",
            "update": "http://example.org/3a884ee0-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/3a884ee0-7f57-0130-e345-282066132de2"
        },
        "uuid": "3a884ee0-7f57-0130-e345-282066132de2",
        "type": null,
        "max_volume": null,
        "aliquots": [

        ]
    }
}
    EOD



    response = post "/labellables", <<-EOD
    {
    "labellable": {
        "user": "username",
        "name": "3a884ee0-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567891400",
                "type": "ean13-barcode"
            }
        }
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "labellable": {
        "actions": {
            "read": "http://example.org/3a9ea280-7f57-0130-e345-282066132de2",
            "create": "http://example.org/3a9ea280-7f57-0130-e345-282066132de2",
            "update": "http://example.org/3a9ea280-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/3a9ea280-7f57-0130-e345-282066132de2"
        },
        "uuid": "3a9ea280-7f57-0130-e345-282066132de2",
        "name": "3a884ee0-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567891400",
                "type": "ean13-barcode"
            }
        }
    }
}
    EOD

  # Add the extracted_rna_tube in the order and start them


    response = put "/2ea9d600-7f57-0130-e344-282066132de2", <<-EOD
    {
    "items": {
        "extracted_tube_rna": {
            "3a6019a0-7f57-0130-e345-282066132de2": {
                "event": "start",
                "batch_uuid": "34a52320-7f57-0130-e345-282066132de2"
            },
            "3a884ee0-7f57-0130-e345-282066132de2": {
                "event": "start",
                "batch_uuid": "34a52320-7f57-0130-e345-282066132de2"
            }
        }
    },
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2"
        },
        "uuid": "2ea9d600-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "in_progress",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_dna": [
                {
                    "uuid": "362fbaa0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "365fd5b0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "by_product_tube_rnap": [
                {
                    "uuid": "368d90c0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "36bb5bd0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "397e9f30-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "39ac3fc0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_dna": [
                {
                    "uuid": "37669990-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "37a563a0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "tube_to_be_extracted_rnap": [
                {
                    "uuid": "38343460-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "38791c40-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_rna": [
                {
                    "uuid": "3915b1c0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "395a39c0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_rna": [
                {
                    "uuid": "3a6019a0-7f57-0130-e345-282066132de2",
                    "status": "in_progress",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "3a884ee0-7f57-0130-e345-282066132de2",
                    "status": "in_progress",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ]
        }
    }
}
    EOD

  # Transfer binding_spin_column_rna into extracted_tube


    response = post "/actions/transfer_tubes_to_tubes", <<-EOD
    {
    "transfer_tubes_to_tubes": {
        "user": "username",
        "transfers": [
            {
                "source_uuid": "3915b1c0-7f57-0130-e345-282066132de2",
                "target_uuid": "3a6019a0-7f57-0130-e345-282066132de2",
                "fraction": 1,
                "aliquot_type": null
            },
            {
                "source_uuid": "395a39c0-7f57-0130-e345-282066132de2",
                "target_uuid": "3a884ee0-7f57-0130-e345-282066132de2",
                "fraction": 1,
                "aliquot_type": null
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
        "user": "username",
        "application": "application",
        "result": {
            "sources": [
                {
                    "spin_column": {
                        "actions": {
                            "read": "http://example.org/3915b1c0-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/3915b1c0-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/3915b1c0-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/3915b1c0-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "3915b1c0-7f57-0130-e345-282066132de2",
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea393c0-7f57-0130-e344-282066132de2",
                                    "name": "sample_0"
                                },
                                "type": "RNA",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/392cde50-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/392cde50-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/392cde50-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/392cde50-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "392cde50-7f57-0130-e345-282066132de2",
                            "barcode": {
                                "value": "1234567899000",
                                "type": "ean13-barcode"
                            }
                        }
                    }
                },
                {
                    "spin_column": {
                        "actions": {
                            "read": "http://example.org/395a39c0-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/395a39c0-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/395a39c0-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/395a39c0-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "395a39c0-7f57-0130-e345-282066132de2",
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea423b0-7f57-0130-e344-282066132de2",
                                    "name": "sample_1"
                                },
                                "type": "RNA",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/396d5db0-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/396d5db0-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/396d5db0-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/396d5db0-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "396d5db0-7f57-0130-e345-282066132de2",
                            "barcode": {
                                "value": "1234567891000",
                                "type": "ean13-barcode"
                            }
                        }
                    }
                }
            ],
            "targets": [
                {
                    "tube": {
                        "actions": {
                            "read": "http://example.org/3a6019a0-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/3a6019a0-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/3a6019a0-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/3a6019a0-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "3a6019a0-7f57-0130-e345-282066132de2",
                        "type": null,
                        "max_volume": null,
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea393c0-7f57-0130-e344-282066132de2",
                                    "name": "sample_0"
                                },
                                "type": "RNA",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/3a6dc620-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/3a6dc620-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/3a6dc620-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/3a6dc620-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "3a6dc620-7f57-0130-e345-282066132de2",
                            "barcode": {
                                "value": "1234567891300",
                                "type": "ean13-barcode"
                            }
                        }
                    }
                },
                {
                    "tube": {
                        "actions": {
                            "read": "http://example.org/3a884ee0-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/3a884ee0-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/3a884ee0-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/3a884ee0-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "3a884ee0-7f57-0130-e345-282066132de2",
                        "type": null,
                        "max_volume": null,
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea423b0-7f57-0130-e344-282066132de2",
                                    "name": "sample_1"
                                },
                                "type": "RNA",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/3a9ea280-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/3a9ea280-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/3a9ea280-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/3a9ea280-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "3a9ea280-7f57-0130-e345-282066132de2",
                            "barcode": {
                                "value": "1234567891400",
                                "type": "ean13-barcode"
                            }
                        }
                    }
                }
            ]
        },
        "transfers": [
            {
                "source_uuid": "3915b1c0-7f57-0130-e345-282066132de2",
                "target_uuid": "3a6019a0-7f57-0130-e345-282066132de2",
                "fraction": 1,
                "aliquot_type": null
            },
            {
                "source_uuid": "395a39c0-7f57-0130-e345-282066132de2",
                "target_uuid": "3a884ee0-7f57-0130-e345-282066132de2",
                "fraction": 1,
                "aliquot_type": null
            }
        ]
    }
}
    EOD

  # Change the status of extracted_tube tubes to done. Change the status of binding_spin_column_rna to unused


    response = put "/2ea9d600-7f57-0130-e344-282066132de2", <<-EOD
    {
    "items": {
        "extracted_tube_rna": {
            "3a6019a0-7f57-0130-e345-282066132de2": {
                "event": "complete"
            },
            "3a884ee0-7f57-0130-e345-282066132de2": {
                "event": "complete"
            }
        },
        "binding_spin_column_rna": {
            "3915b1c0-7f57-0130-e345-282066132de2": {
                "event": "unuse"
            },
            "395a39c0-7f57-0130-e345-282066132de2": {
                "event": "unuse"
            }
        }
    },
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2"
        },
        "uuid": "2ea9d600-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "in_progress",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_dna": [
                {
                    "uuid": "362fbaa0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "365fd5b0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "by_product_tube_rnap": [
                {
                    "uuid": "368d90c0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "36bb5bd0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "397e9f30-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "39ac3fc0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_dna": [
                {
                    "uuid": "37669990-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "37a563a0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "tube_to_be_extracted_rnap": [
                {
                    "uuid": "38343460-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "38791c40-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_rna": [
                {
                    "uuid": "3915b1c0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "395a39c0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_rna": [
                {
                    "uuid": "3a6019a0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "3a884ee0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ]
        }
    }
}
    EOD



  # Create new tubes 


    response = post "/tubes", <<-EOD
    {
    "tube": {
        "user": "username"
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "tube": {
        "actions": {
            "read": "http://example.org/3e795c30-7f57-0130-e345-282066132de2",
            "create": "http://example.org/3e795c30-7f57-0130-e345-282066132de2",
            "update": "http://example.org/3e795c30-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/3e795c30-7f57-0130-e345-282066132de2"
        },
        "uuid": "3e795c30-7f57-0130-e345-282066132de2",
        "type": null,
        "max_volume": null,
        "aliquots": [

        ]
    }
}
    EOD



    response = post "/labellables", <<-EOD
    {
    "labellable": {
        "user": "username",
        "name": "3e795c30-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567892100",
                "type": "ean13-barcode"
            }
        }
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "labellable": {
        "actions": {
            "read": "http://example.org/3e8d2a10-7f57-0130-e345-282066132de2",
            "create": "http://example.org/3e8d2a10-7f57-0130-e345-282066132de2",
            "update": "http://example.org/3e8d2a10-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/3e8d2a10-7f57-0130-e345-282066132de2"
        },
        "uuid": "3e8d2a10-7f57-0130-e345-282066132de2",
        "name": "3e795c30-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567892100",
                "type": "ean13-barcode"
            }
        }
    }
}
    EOD

  # Add the extracted_rna_tube in the order and start them


    response = put "/2eaaf660-7f57-0130-e344-282066132de2", <<-EOD
    {
    "items": {
        "extracted_tube_rna": {
            "3e795c30-7f57-0130-e345-282066132de2": {
                "event": "start",
                "batch_uuid": "34a52320-7f57-0130-e345-282066132de2"
            }
        }
    },
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2"
        },
        "uuid": "2eaaf660-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "in_progress",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_dna": [
                {
                    "uuid": "3bb68680-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "by_product_tube_rnap": [
                {
                    "uuid": "3be83770-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "3dc69b90-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_dna": [
                {
                    "uuid": "3c744720-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "tube_to_be_extracted_rnap": [
                {
                    "uuid": "3d0b15d0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_rna": [
                {
                    "uuid": "3d9bd4f0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_rna": [
                {
                    "uuid": "3e795c30-7f57-0130-e345-282066132de2",
                    "status": "in_progress",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ]
        }
    }
}
    EOD

  # Transfer binding_spin_column_rna into extracted_tube


    response = post "/actions/transfer_tubes_to_tubes", <<-EOD
    {
    "transfer_tubes_to_tubes": {
        "user": "username",
        "transfers": [
            {
                "source_uuid": "3d9bd4f0-7f57-0130-e345-282066132de2",
                "target_uuid": "3e795c30-7f57-0130-e345-282066132de2",
                "fraction": 1,
                "aliquot_type": null
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
        "user": "username",
        "application": "application",
        "result": {
            "sources": [
                {
                    "spin_column": {
                        "actions": {
                            "read": "http://example.org/3d9bd4f0-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/3d9bd4f0-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/3d9bd4f0-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/3d9bd4f0-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "3d9bd4f0-7f57-0130-e345-282066132de2",
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea4b420-7f57-0130-e344-282066132de2",
                                    "name": "sample_2"
                                },
                                "type": "RNA",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/3db09950-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/3db09950-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/3db09950-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/3db09950-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "3db09950-7f57-0130-e345-282066132de2",
                            "barcode": {
                                "value": "1234567891900",
                                "type": "ean13-barcode"
                            }
                        }
                    }
                }
            ],
            "targets": [
                {
                    "tube": {
                        "actions": {
                            "read": "http://example.org/3e795c30-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/3e795c30-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/3e795c30-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/3e795c30-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "3e795c30-7f57-0130-e345-282066132de2",
                        "type": null,
                        "max_volume": null,
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea4b420-7f57-0130-e344-282066132de2",
                                    "name": "sample_2"
                                },
                                "type": "RNA",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/3e8d2a10-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/3e8d2a10-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/3e8d2a10-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/3e8d2a10-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "3e8d2a10-7f57-0130-e345-282066132de2",
                            "barcode": {
                                "value": "1234567892100",
                                "type": "ean13-barcode"
                            }
                        }
                    }
                }
            ]
        },
        "transfers": [
            {
                "source_uuid": "3d9bd4f0-7f57-0130-e345-282066132de2",
                "target_uuid": "3e795c30-7f57-0130-e345-282066132de2",
                "fraction": 1,
                "aliquot_type": null
            }
        ]
    }
}
    EOD

  # Change the status of extracted_tube tubes to done. Change the status of binding_spin_column_rna to unused


    response = put "/2eaaf660-7f57-0130-e344-282066132de2", <<-EOD
    {
    "items": {
        "extracted_tube_rna": {
            "3e795c30-7f57-0130-e345-282066132de2": {
                "event": "complete"
            }
        },
        "binding_spin_column_rna": {
            "3d9bd4f0-7f57-0130-e345-282066132de2": {
                "event": "unuse"
            }
        }
    },
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2"
        },
        "uuid": "2eaaf660-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "in_progress",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_dna": [
                {
                    "uuid": "3bb68680-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "by_product_tube_rnap": [
                {
                    "uuid": "3be83770-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "3dc69b90-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_dna": [
                {
                    "uuid": "3c744720-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "tube_to_be_extracted_rnap": [
                {
                    "uuid": "3d0b15d0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_rna": [
                {
                    "uuid": "3d9bd4f0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_rna": [
                {
                    "uuid": "3e795c30-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ]
        }
    }
}
    EOD



  # Create new tubes


    response = post "/tubes", <<-EOD
    {
    "tube": {
        "user": "username"
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "tube": {
        "actions": {
            "read": "http://example.org/3f2f7110-7f57-0130-e345-282066132de2",
            "create": "http://example.org/3f2f7110-7f57-0130-e345-282066132de2",
            "update": "http://example.org/3f2f7110-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/3f2f7110-7f57-0130-e345-282066132de2"
        },
        "uuid": "3f2f7110-7f57-0130-e345-282066132de2",
        "type": null,
        "max_volume": null,
        "aliquots": [

        ]
    }
}
    EOD



    response = post "/labellables", <<-EOD
    {
    "labellable": {
        "user": "username",
        "name": "3f2f7110-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567892200",
                "type": "2d-barcode"
            }
        }
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "labellable": {
        "actions": {
            "read": "http://example.org/3f3d3a50-7f57-0130-e345-282066132de2",
            "create": "http://example.org/3f3d3a50-7f57-0130-e345-282066132de2",
            "update": "http://example.org/3f3d3a50-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/3f3d3a50-7f57-0130-e345-282066132de2"
        },
        "uuid": "3f3d3a50-7f57-0130-e345-282066132de2",
        "name": "3f2f7110-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567892200",
                "type": "2d-barcode"
            }
        }
    }
}
    EOD



    response = post "/tubes", <<-EOD
    {
    "tube": {
        "user": "username"
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "tube": {
        "actions": {
            "read": "http://example.org/3f551340-7f57-0130-e345-282066132de2",
            "create": "http://example.org/3f551340-7f57-0130-e345-282066132de2",
            "update": "http://example.org/3f551340-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/3f551340-7f57-0130-e345-282066132de2"
        },
        "uuid": "3f551340-7f57-0130-e345-282066132de2",
        "type": null,
        "max_volume": null,
        "aliquots": [

        ]
    }
}
    EOD



    response = post "/labellables", <<-EOD
    {
    "labellable": {
        "user": "username",
        "name": "3f551340-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567892300",
                "type": "2d-barcode"
            }
        }
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "labellable": {
        "actions": {
            "read": "http://example.org/3f6943a0-7f57-0130-e345-282066132de2",
            "create": "http://example.org/3f6943a0-7f57-0130-e345-282066132de2",
            "update": "http://example.org/3f6943a0-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/3f6943a0-7f57-0130-e345-282066132de2"
        },
        "uuid": "3f6943a0-7f57-0130-e345-282066132de2",
        "name": "3f551340-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567892300",
                "type": "2d-barcode"
            }
        }
    }
}
    EOD

  # Add the 2d tubes in the order and start them


    response = put "/2ea9d600-7f57-0130-e344-282066132de2", <<-EOD
    {
    "items": {
        "name_rna": {
            "3f2f7110-7f57-0130-e345-282066132de2": {
                "event": "start",
                "batch_uuid": "34a52320-7f57-0130-e345-282066132de2"
            },
            "3f551340-7f57-0130-e345-282066132de2": {
                "event": "start",
                "batch_uuid": "34a52320-7f57-0130-e345-282066132de2"
            }
        }
    },
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2"
        },
        "uuid": "2ea9d600-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "in_progress",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_dna": [
                {
                    "uuid": "362fbaa0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "365fd5b0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "by_product_tube_rnap": [
                {
                    "uuid": "368d90c0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "36bb5bd0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "397e9f30-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "39ac3fc0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_dna": [
                {
                    "uuid": "37669990-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "37a563a0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "tube_to_be_extracted_rnap": [
                {
                    "uuid": "38343460-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "38791c40-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_rna": [
                {
                    "uuid": "3915b1c0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "395a39c0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_rna": [
                {
                    "uuid": "3a6019a0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "3a884ee0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "name_rna": [
                {
                    "uuid": "3f2f7110-7f57-0130-e345-282066132de2",
                    "status": "in_progress",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "3f551340-7f57-0130-e345-282066132de2",
                    "status": "in_progress",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ]
        }
    }
}
    EOD

  # Transfer extracted tubes into 2D tubes


    response = post "/actions/transfer_tubes_to_tubes", <<-EOD
    {
    "transfer_tubes_to_tubes": {
        "user": "username",
        "transfers": [
            {
                "source_uuid": "3a6019a0-7f57-0130-e345-282066132de2",
                "target_uuid": "3f2f7110-7f57-0130-e345-282066132de2",
                "fraction": 1,
                "aliquot_type": null
            },
            {
                "source_uuid": "3a884ee0-7f57-0130-e345-282066132de2",
                "target_uuid": "3f551340-7f57-0130-e345-282066132de2",
                "fraction": 1,
                "aliquot_type": null
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
        "user": "username",
        "application": "application",
        "result": {
            "sources": [
                {
                    "tube": {
                        "actions": {
                            "read": "http://example.org/3a6019a0-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/3a6019a0-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/3a6019a0-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/3a6019a0-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "3a6019a0-7f57-0130-e345-282066132de2",
                        "type": null,
                        "max_volume": null,
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea393c0-7f57-0130-e344-282066132de2",
                                    "name": "sample_0"
                                },
                                "type": "RNA",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/3a6dc620-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/3a6dc620-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/3a6dc620-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/3a6dc620-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "3a6dc620-7f57-0130-e345-282066132de2",
                            "barcode": {
                                "value": "1234567891300",
                                "type": "ean13-barcode"
                            }
                        }
                    }
                },
                {
                    "tube": {
                        "actions": {
                            "read": "http://example.org/3a884ee0-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/3a884ee0-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/3a884ee0-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/3a884ee0-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "3a884ee0-7f57-0130-e345-282066132de2",
                        "type": null,
                        "max_volume": null,
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea423b0-7f57-0130-e344-282066132de2",
                                    "name": "sample_1"
                                },
                                "type": "RNA",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/3a9ea280-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/3a9ea280-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/3a9ea280-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/3a9ea280-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "3a9ea280-7f57-0130-e345-282066132de2",
                            "barcode": {
                                "value": "1234567891400",
                                "type": "ean13-barcode"
                            }
                        }
                    }
                }
            ],
            "targets": [
                {
                    "tube": {
                        "actions": {
                            "read": "http://example.org/3f2f7110-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/3f2f7110-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/3f2f7110-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/3f2f7110-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "3f2f7110-7f57-0130-e345-282066132de2",
                        "type": null,
                        "max_volume": null,
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea393c0-7f57-0130-e344-282066132de2",
                                    "name": "sample_0"
                                },
                                "type": "RNA",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/3f3d3a50-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/3f3d3a50-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/3f3d3a50-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/3f3d3a50-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "3f3d3a50-7f57-0130-e345-282066132de2",
                            "barcode": {
                                "value": "1234567892200",
                                "type": "2d-barcode"
                            }
                        }
                    }
                },
                {
                    "tube": {
                        "actions": {
                            "read": "http://example.org/3f551340-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/3f551340-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/3f551340-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/3f551340-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "3f551340-7f57-0130-e345-282066132de2",
                        "type": null,
                        "max_volume": null,
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea423b0-7f57-0130-e344-282066132de2",
                                    "name": "sample_1"
                                },
                                "type": "RNA",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/3f6943a0-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/3f6943a0-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/3f6943a0-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/3f6943a0-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "3f6943a0-7f57-0130-e345-282066132de2",
                            "barcode": {
                                "value": "1234567892300",
                                "type": "2d-barcode"
                            }
                        }
                    }
                }
            ]
        },
        "transfers": [
            {
                "source_uuid": "3a6019a0-7f57-0130-e345-282066132de2",
                "target_uuid": "3f2f7110-7f57-0130-e345-282066132de2",
                "fraction": 1,
                "aliquot_type": null
            },
            {
                "source_uuid": "3a884ee0-7f57-0130-e345-282066132de2",
                "target_uuid": "3f551340-7f57-0130-e345-282066132de2",
                "fraction": 1,
                "aliquot_type": null
            }
        ]
    }
}
    EOD

  # Change the status of extracted_tube tubes to unused. Change the status of 2d tubes to complete


    response = put "/2ea9d600-7f57-0130-e344-282066132de2", <<-EOD
    {
    "items": {
        "extracted_tube_rna": {
            "3a6019a0-7f57-0130-e345-282066132de2": {
                "event": "unuse"
            },
            "3a884ee0-7f57-0130-e345-282066132de2": {
                "event": "unuse"
            }
        },
        "name_rna": {
            "3f2f7110-7f57-0130-e345-282066132de2": {
                "event": "complete"
            },
            "3f551340-7f57-0130-e345-282066132de2": {
                "event": "complete"
            }
        }
    },
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2"
        },
        "uuid": "2ea9d600-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "in_progress",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_dna": [
                {
                    "uuid": "362fbaa0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "365fd5b0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "by_product_tube_rnap": [
                {
                    "uuid": "368d90c0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "36bb5bd0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "397e9f30-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "39ac3fc0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_dna": [
                {
                    "uuid": "37669990-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "37a563a0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "tube_to_be_extracted_rnap": [
                {
                    "uuid": "38343460-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "38791c40-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_rna": [
                {
                    "uuid": "3915b1c0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "395a39c0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_rna": [
                {
                    "uuid": "3a6019a0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "3a884ee0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "name_rna": [
                {
                    "uuid": "3f2f7110-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "3f551340-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ]
        }
    }
}
    EOD

  # Create a new tube rack 


    response = post "/tube_racks", <<-EOD
    {
    "tube_rack": {
        "user": "username",
        "number_of_columns": 12,
        "number_of_rows": 8,
        "tubes": {
            "A1": "3f2f7110-7f57-0130-e345-282066132de2",
            "A2": "3f551340-7f57-0130-e345-282066132de2"
        }
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "tube_rack": {
        "actions": {
            "read": "http://example.org/401029e0-7f57-0130-e345-282066132de2",
            "create": "http://example.org/401029e0-7f57-0130-e345-282066132de2",
            "update": "http://example.org/401029e0-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/401029e0-7f57-0130-e345-282066132de2"
        },
        "uuid": "401029e0-7f57-0130-e345-282066132de2",
        "number_of_rows": 8,
        "number_of_columns": 12,
        "tubes": {
            "A1": {
                "actions": {
                    "read": "http://example.org/3f2f7110-7f57-0130-e345-282066132de2",
                    "create": "http://example.org/3f2f7110-7f57-0130-e345-282066132de2",
                    "update": "http://example.org/3f2f7110-7f57-0130-e345-282066132de2",
                    "delete": "http://example.org/3f2f7110-7f57-0130-e345-282066132de2"
                },
                "uuid": "3f2f7110-7f57-0130-e345-282066132de2",
                "type": null,
                "max_volume": null,
                "aliquots": [
                    {
                        "sample": {
                            "actions": {
                                "read": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                "create": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                "update": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                "delete": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2"
                            },
                            "uuid": "2ea393c0-7f57-0130-e344-282066132de2",
                            "name": "sample_0"
                        },
                        "type": "RNA",
                        "unit": "mole"
                    }
                ],
                "labels": {
                    "actions": {
                        "read": "http://example.org/3f3d3a50-7f57-0130-e345-282066132de2",
                        "create": "http://example.org/3f3d3a50-7f57-0130-e345-282066132de2",
                        "update": "http://example.org/3f3d3a50-7f57-0130-e345-282066132de2",
                        "delete": "http://example.org/3f3d3a50-7f57-0130-e345-282066132de2"
                    },
                    "uuid": "3f3d3a50-7f57-0130-e345-282066132de2",
                    "barcode": {
                        "value": "1234567892200",
                        "type": "2d-barcode"
                    }
                }
            },
            "A2": {
                "actions": {
                    "read": "http://example.org/3f551340-7f57-0130-e345-282066132de2",
                    "create": "http://example.org/3f551340-7f57-0130-e345-282066132de2",
                    "update": "http://example.org/3f551340-7f57-0130-e345-282066132de2",
                    "delete": "http://example.org/3f551340-7f57-0130-e345-282066132de2"
                },
                "uuid": "3f551340-7f57-0130-e345-282066132de2",
                "type": null,
                "max_volume": null,
                "aliquots": [
                    {
                        "sample": {
                            "actions": {
                                "read": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                "create": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                "update": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                "delete": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2"
                            },
                            "uuid": "2ea423b0-7f57-0130-e344-282066132de2",
                            "name": "sample_1"
                        },
                        "type": "RNA",
                        "unit": "mole"
                    }
                ],
                "labels": {
                    "actions": {
                        "read": "http://example.org/3f6943a0-7f57-0130-e345-282066132de2",
                        "create": "http://example.org/3f6943a0-7f57-0130-e345-282066132de2",
                        "update": "http://example.org/3f6943a0-7f57-0130-e345-282066132de2",
                        "delete": "http://example.org/3f6943a0-7f57-0130-e345-282066132de2"
                    },
                    "uuid": "3f6943a0-7f57-0130-e345-282066132de2",
                    "barcode": {
                        "value": "1234567892300",
                        "type": "2d-barcode"
                    }
                }
            }
        }
    }
}
    EOD

  # Add the tube rack in the order and start it


    response = put "/2ea9d600-7f57-0130-e344-282066132de2", <<-EOD
    {
    "items": {
        "stock_rna": {
            "401029e0-7f57-0130-e345-282066132de2": {
                "event": "start",
                "batch_uuid": "34a52320-7f57-0130-e345-282066132de2"
            }
        }
    },
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2"
        },
        "uuid": "2ea9d600-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "in_progress",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_dna": [
                {
                    "uuid": "362fbaa0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "365fd5b0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "by_product_tube_rnap": [
                {
                    "uuid": "368d90c0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "36bb5bd0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "397e9f30-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "39ac3fc0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_dna": [
                {
                    "uuid": "37669990-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "37a563a0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "tube_to_be_extracted_rnap": [
                {
                    "uuid": "38343460-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "38791c40-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_rna": [
                {
                    "uuid": "3915b1c0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "395a39c0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_rna": [
                {
                    "uuid": "3a6019a0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "3a884ee0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "name_rna": [
                {
                    "uuid": "3f2f7110-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "3f551340-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "stock_rna": [
                {
                    "uuid": "401029e0-7f57-0130-e345-282066132de2",
                    "status": "in_progress",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ]
        }
    }
}
    EOD

  # Change the type of the rube rack to complete


    response = put "/2ea9d600-7f57-0130-e344-282066132de2", <<-EOD
    {
    "items": {
        "stock_rna": {
            "401029e0-7f57-0130-e345-282066132de2": {
                "event": "complete"
            }
        }
    },
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2"
        },
        "uuid": "2ea9d600-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "in_progress",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_dna": [
                {
                    "uuid": "362fbaa0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "365fd5b0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "by_product_tube_rnap": [
                {
                    "uuid": "368d90c0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "36bb5bd0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "397e9f30-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "39ac3fc0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_dna": [
                {
                    "uuid": "37669990-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "37a563a0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "tube_to_be_extracted_rnap": [
                {
                    "uuid": "38343460-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "38791c40-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_rna": [
                {
                    "uuid": "3915b1c0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "395a39c0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_rna": [
                {
                    "uuid": "3a6019a0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "3a884ee0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "name_rna": [
                {
                    "uuid": "3f2f7110-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "3f551340-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "stock_rna": [
                {
                    "uuid": "401029e0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ]
        }
    }
}
    EOD



  # Create new tubes


    response = post "/tubes", <<-EOD
    {
    "tube": {
        "user": "username"
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "tube": {
        "actions": {
            "read": "http://example.org/409cf0e0-7f57-0130-e345-282066132de2",
            "create": "http://example.org/409cf0e0-7f57-0130-e345-282066132de2",
            "update": "http://example.org/409cf0e0-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/409cf0e0-7f57-0130-e345-282066132de2"
        },
        "uuid": "409cf0e0-7f57-0130-e345-282066132de2",
        "type": null,
        "max_volume": null,
        "aliquots": [

        ]
    }
}
    EOD



    response = post "/labellables", <<-EOD
    {
    "labellable": {
        "user": "username",
        "name": "409cf0e0-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567892400",
                "type": "2d-barcode"
            }
        }
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "labellable": {
        "actions": {
            "read": "http://example.org/40a8d510-7f57-0130-e345-282066132de2",
            "create": "http://example.org/40a8d510-7f57-0130-e345-282066132de2",
            "update": "http://example.org/40a8d510-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/40a8d510-7f57-0130-e345-282066132de2"
        },
        "uuid": "40a8d510-7f57-0130-e345-282066132de2",
        "name": "409cf0e0-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567892400",
                "type": "2d-barcode"
            }
        }
    }
}
    EOD

  # Add the 2d tubes in the order and start them


    response = put "/2eaaf660-7f57-0130-e344-282066132de2", <<-EOD
    {
    "items": {
        "name_rna": {
            "409cf0e0-7f57-0130-e345-282066132de2": {
                "event": "start",
                "batch_uuid": "34a52320-7f57-0130-e345-282066132de2"
            }
        }
    },
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2"
        },
        "uuid": "2eaaf660-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "in_progress",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_dna": [
                {
                    "uuid": "3bb68680-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "by_product_tube_rnap": [
                {
                    "uuid": "3be83770-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "3dc69b90-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_dna": [
                {
                    "uuid": "3c744720-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "tube_to_be_extracted_rnap": [
                {
                    "uuid": "3d0b15d0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_rna": [
                {
                    "uuid": "3d9bd4f0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_rna": [
                {
                    "uuid": "3e795c30-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "name_rna": [
                {
                    "uuid": "409cf0e0-7f57-0130-e345-282066132de2",
                    "status": "in_progress",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ]
        }
    }
}
    EOD

  # Transfer extracted tubes into 2D tubes


    response = post "/actions/transfer_tubes_to_tubes", <<-EOD
    {
    "transfer_tubes_to_tubes": {
        "user": "username",
        "transfers": [
            {
                "source_uuid": "3e795c30-7f57-0130-e345-282066132de2",
                "target_uuid": "409cf0e0-7f57-0130-e345-282066132de2",
                "fraction": 1,
                "aliquot_type": null
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
        "user": "username",
        "application": "application",
        "result": {
            "sources": [
                {
                    "tube": {
                        "actions": {
                            "read": "http://example.org/3e795c30-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/3e795c30-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/3e795c30-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/3e795c30-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "3e795c30-7f57-0130-e345-282066132de2",
                        "type": null,
                        "max_volume": null,
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea4b420-7f57-0130-e344-282066132de2",
                                    "name": "sample_2"
                                },
                                "type": "RNA",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/3e8d2a10-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/3e8d2a10-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/3e8d2a10-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/3e8d2a10-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "3e8d2a10-7f57-0130-e345-282066132de2",
                            "barcode": {
                                "value": "1234567892100",
                                "type": "ean13-barcode"
                            }
                        }
                    }
                }
            ],
            "targets": [
                {
                    "tube": {
                        "actions": {
                            "read": "http://example.org/409cf0e0-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/409cf0e0-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/409cf0e0-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/409cf0e0-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "409cf0e0-7f57-0130-e345-282066132de2",
                        "type": null,
                        "max_volume": null,
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea4b420-7f57-0130-e344-282066132de2",
                                    "name": "sample_2"
                                },
                                "type": "RNA",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/40a8d510-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/40a8d510-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/40a8d510-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/40a8d510-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "40a8d510-7f57-0130-e345-282066132de2",
                            "barcode": {
                                "value": "1234567892400",
                                "type": "2d-barcode"
                            }
                        }
                    }
                }
            ]
        },
        "transfers": [
            {
                "source_uuid": "3e795c30-7f57-0130-e345-282066132de2",
                "target_uuid": "409cf0e0-7f57-0130-e345-282066132de2",
                "fraction": 1,
                "aliquot_type": null
            }
        ]
    }
}
    EOD

  # Change the status of extracted_tube tubes to unused. Change the status of 2d tubes to complete


    response = put "/2eaaf660-7f57-0130-e344-282066132de2", <<-EOD
    {
    "items": {
        "extracted_tube_rna": {
            "3e795c30-7f57-0130-e345-282066132de2": {
                "event": "unuse"
            }
        },
        "name_rna": {
            "409cf0e0-7f57-0130-e345-282066132de2": {
                "event": "complete"
            }
        }
    },
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2"
        },
        "uuid": "2eaaf660-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "in_progress",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_dna": [
                {
                    "uuid": "3bb68680-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "by_product_tube_rnap": [
                {
                    "uuid": "3be83770-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "3dc69b90-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_dna": [
                {
                    "uuid": "3c744720-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "tube_to_be_extracted_rnap": [
                {
                    "uuid": "3d0b15d0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_rna": [
                {
                    "uuid": "3d9bd4f0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_rna": [
                {
                    "uuid": "3e795c30-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "name_rna": [
                {
                    "uuid": "409cf0e0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ]
        }
    }
}
    EOD

  # Create a new tube rack 


    response = post "/tube_racks", <<-EOD
    {
    "tube_rack": {
        "user": "username",
        "number_of_columns": 12,
        "number_of_rows": 8,
        "tubes": {
            "A1": "409cf0e0-7f57-0130-e345-282066132de2"
        }
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "tube_rack": {
        "actions": {
            "read": "http://example.org/4167fda0-7f57-0130-e345-282066132de2",
            "create": "http://example.org/4167fda0-7f57-0130-e345-282066132de2",
            "update": "http://example.org/4167fda0-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/4167fda0-7f57-0130-e345-282066132de2"
        },
        "uuid": "4167fda0-7f57-0130-e345-282066132de2",
        "number_of_rows": 8,
        "number_of_columns": 12,
        "tubes": {
            "A1": {
                "actions": {
                    "read": "http://example.org/409cf0e0-7f57-0130-e345-282066132de2",
                    "create": "http://example.org/409cf0e0-7f57-0130-e345-282066132de2",
                    "update": "http://example.org/409cf0e0-7f57-0130-e345-282066132de2",
                    "delete": "http://example.org/409cf0e0-7f57-0130-e345-282066132de2"
                },
                "uuid": "409cf0e0-7f57-0130-e345-282066132de2",
                "type": null,
                "max_volume": null,
                "aliquots": [
                    {
                        "sample": {
                            "actions": {
                                "read": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                "create": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                "update": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                "delete": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2"
                            },
                            "uuid": "2ea4b420-7f57-0130-e344-282066132de2",
                            "name": "sample_2"
                        },
                        "type": "RNA",
                        "unit": "mole"
                    }
                ],
                "labels": {
                    "actions": {
                        "read": "http://example.org/40a8d510-7f57-0130-e345-282066132de2",
                        "create": "http://example.org/40a8d510-7f57-0130-e345-282066132de2",
                        "update": "http://example.org/40a8d510-7f57-0130-e345-282066132de2",
                        "delete": "http://example.org/40a8d510-7f57-0130-e345-282066132de2"
                    },
                    "uuid": "40a8d510-7f57-0130-e345-282066132de2",
                    "barcode": {
                        "value": "1234567892400",
                        "type": "2d-barcode"
                    }
                }
            }
        }
    }
}
    EOD

  # Add the tube rack in the order and start it


    response = put "/2eaaf660-7f57-0130-e344-282066132de2", <<-EOD
    {
    "items": {
        "stock_rna": {
            "4167fda0-7f57-0130-e345-282066132de2": {
                "event": "start",
                "batch_uuid": "34a52320-7f57-0130-e345-282066132de2"
            }
        }
    },
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2"
        },
        "uuid": "2eaaf660-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "in_progress",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_dna": [
                {
                    "uuid": "3bb68680-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "by_product_tube_rnap": [
                {
                    "uuid": "3be83770-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "3dc69b90-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_dna": [
                {
                    "uuid": "3c744720-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "tube_to_be_extracted_rnap": [
                {
                    "uuid": "3d0b15d0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_rna": [
                {
                    "uuid": "3d9bd4f0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_rna": [
                {
                    "uuid": "3e795c30-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "name_rna": [
                {
                    "uuid": "409cf0e0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "stock_rna": [
                {
                    "uuid": "4167fda0-7f57-0130-e345-282066132de2",
                    "status": "in_progress",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ]
        }
    }
}
    EOD

  # Change the type of the rube rack to complete


    response = put "/2eaaf660-7f57-0130-e344-282066132de2", <<-EOD
    {
    "items": {
        "stock_rna": {
            "4167fda0-7f57-0130-e345-282066132de2": {
                "event": "complete"
            }
        }
    },
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2"
        },
        "uuid": "2eaaf660-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "in_progress",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_dna": [
                {
                    "uuid": "3bb68680-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "by_product_tube_rnap": [
                {
                    "uuid": "3be83770-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "3dc69b90-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_dna": [
                {
                    "uuid": "3c744720-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "tube_to_be_extracted_rnap": [
                {
                    "uuid": "3d0b15d0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_rna": [
                {
                    "uuid": "3d9bd4f0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_rna": [
                {
                    "uuid": "3e795c30-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "name_rna": [
                {
                    "uuid": "409cf0e0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "stock_rna": [
                {
                    "uuid": "4167fda0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ]
        }
    }
}
    EOD



  # Create new tubes


    response = post "/tubes", <<-EOD
    {
    "tube": {
        "user": "username"
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "tube": {
        "actions": {
            "read": "http://example.org/41e65bf0-7f57-0130-e345-282066132de2",
            "create": "http://example.org/41e65bf0-7f57-0130-e345-282066132de2",
            "update": "http://example.org/41e65bf0-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/41e65bf0-7f57-0130-e345-282066132de2"
        },
        "uuid": "41e65bf0-7f57-0130-e345-282066132de2",
        "type": null,
        "max_volume": null,
        "aliquots": [

        ]
    }
}
    EOD



    response = post "/labellables", <<-EOD
    {
    "labellable": {
        "user": "username",
        "name": "41e65bf0-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567892500",
                "type": "2d-barcode"
            }
        }
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "labellable": {
        "actions": {
            "read": "http://example.org/41f5ab70-7f57-0130-e345-282066132de2",
            "create": "http://example.org/41f5ab70-7f57-0130-e345-282066132de2",
            "update": "http://example.org/41f5ab70-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/41f5ab70-7f57-0130-e345-282066132de2"
        },
        "uuid": "41f5ab70-7f57-0130-e345-282066132de2",
        "name": "41e65bf0-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567892500",
                "type": "2d-barcode"
            }
        }
    }
}
    EOD



    response = post "/tubes", <<-EOD
    {
    "tube": {
        "user": "username"
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "tube": {
        "actions": {
            "read": "http://example.org/42288860-7f57-0130-e345-282066132de2",
            "create": "http://example.org/42288860-7f57-0130-e345-282066132de2",
            "update": "http://example.org/42288860-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/42288860-7f57-0130-e345-282066132de2"
        },
        "uuid": "42288860-7f57-0130-e345-282066132de2",
        "type": null,
        "max_volume": null,
        "aliquots": [

        ]
    }
}
    EOD



    response = post "/labellables", <<-EOD
    {
    "labellable": {
        "user": "username",
        "name": "42288860-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567892600",
                "type": "2d-barcode"
            }
        }
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "labellable": {
        "actions": {
            "read": "http://example.org/423b3e80-7f57-0130-e345-282066132de2",
            "create": "http://example.org/423b3e80-7f57-0130-e345-282066132de2",
            "update": "http://example.org/423b3e80-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/423b3e80-7f57-0130-e345-282066132de2"
        },
        "uuid": "423b3e80-7f57-0130-e345-282066132de2",
        "name": "42288860-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567892600",
                "type": "2d-barcode"
            }
        }
    }
}
    EOD

  # Add the 2d tubes in the order and start them


    response = put "/2ea9d600-7f57-0130-e344-282066132de2", <<-EOD
    {
    "items": {
        "name_dna": {
            "41e65bf0-7f57-0130-e345-282066132de2": {
                "event": "start",
                "batch_uuid": "34a52320-7f57-0130-e345-282066132de2"
            },
            "42288860-7f57-0130-e345-282066132de2": {
                "event": "start",
                "batch_uuid": "34a52320-7f57-0130-e345-282066132de2"
            }
        }
    },
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2"
        },
        "uuid": "2ea9d600-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "in_progress",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_dna": [
                {
                    "uuid": "362fbaa0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "365fd5b0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "by_product_tube_rnap": [
                {
                    "uuid": "368d90c0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "36bb5bd0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "397e9f30-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "39ac3fc0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_dna": [
                {
                    "uuid": "37669990-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "37a563a0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "tube_to_be_extracted_rnap": [
                {
                    "uuid": "38343460-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "38791c40-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_rna": [
                {
                    "uuid": "3915b1c0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "395a39c0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_rna": [
                {
                    "uuid": "3a6019a0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "3a884ee0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "name_rna": [
                {
                    "uuid": "3f2f7110-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "3f551340-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "stock_rna": [
                {
                    "uuid": "401029e0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "name_dna": [
                {
                    "uuid": "41e65bf0-7f57-0130-e345-282066132de2",
                    "status": "in_progress",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "42288860-7f57-0130-e345-282066132de2",
                    "status": "in_progress",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ]
        }
    }
}
    EOD

  # Transfer extracted tubes into 2D tubes


    response = post "/actions/transfer_tubes_to_tubes", <<-EOD
    {
    "transfer_tubes_to_tubes": {
        "user": "username",
        "transfers": [
            {
                "source_uuid": "37669990-7f57-0130-e345-282066132de2",
                "target_uuid": "41e65bf0-7f57-0130-e345-282066132de2",
                "fraction": 1,
                "aliquot_type": null
            },
            {
                "source_uuid": "37a563a0-7f57-0130-e345-282066132de2",
                "target_uuid": "42288860-7f57-0130-e345-282066132de2",
                "fraction": 1,
                "aliquot_type": null
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
        "user": "username",
        "application": "application",
        "result": {
            "sources": [
                {
                    "tube": {
                        "actions": {
                            "read": "http://example.org/37669990-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/37669990-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/37669990-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/37669990-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "37669990-7f57-0130-e345-282066132de2",
                        "type": null,
                        "max_volume": null,
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea393c0-7f57-0130-e344-282066132de2",
                                    "name": "sample_0"
                                },
                                "type": "DNA",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/37795ee0-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/37795ee0-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/37795ee0-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/37795ee0-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "37795ee0-7f57-0130-e345-282066132de2",
                            "barcode": {
                                "value": "1234567895000",
                                "type": "ean13-barcode"
                            }
                        }
                    }
                },
                {
                    "tube": {
                        "actions": {
                            "read": "http://example.org/37a563a0-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/37a563a0-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/37a563a0-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/37a563a0-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "37a563a0-7f57-0130-e345-282066132de2",
                        "type": null,
                        "max_volume": null,
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea423b0-7f57-0130-e344-282066132de2",
                                    "name": "sample_1"
                                },
                                "type": "DNA",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/37b7e9e0-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/37b7e9e0-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/37b7e9e0-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/37b7e9e0-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "37b7e9e0-7f57-0130-e345-282066132de2",
                            "barcode": {
                                "value": "1234567896000",
                                "type": "ean13-barcode"
                            }
                        }
                    }
                }
            ],
            "targets": [
                {
                    "tube": {
                        "actions": {
                            "read": "http://example.org/41e65bf0-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/41e65bf0-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/41e65bf0-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/41e65bf0-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "41e65bf0-7f57-0130-e345-282066132de2",
                        "type": null,
                        "max_volume": null,
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea393c0-7f57-0130-e344-282066132de2",
                                    "name": "sample_0"
                                },
                                "type": "DNA",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/41f5ab70-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/41f5ab70-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/41f5ab70-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/41f5ab70-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "41f5ab70-7f57-0130-e345-282066132de2",
                            "barcode": {
                                "value": "1234567892500",
                                "type": "2d-barcode"
                            }
                        }
                    }
                },
                {
                    "tube": {
                        "actions": {
                            "read": "http://example.org/42288860-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/42288860-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/42288860-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/42288860-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "42288860-7f57-0130-e345-282066132de2",
                        "type": null,
                        "max_volume": null,
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea423b0-7f57-0130-e344-282066132de2",
                                    "name": "sample_1"
                                },
                                "type": "DNA",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/423b3e80-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/423b3e80-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/423b3e80-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/423b3e80-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "423b3e80-7f57-0130-e345-282066132de2",
                            "barcode": {
                                "value": "1234567892600",
                                "type": "2d-barcode"
                            }
                        }
                    }
                }
            ]
        },
        "transfers": [
            {
                "source_uuid": "37669990-7f57-0130-e345-282066132de2",
                "target_uuid": "41e65bf0-7f57-0130-e345-282066132de2",
                "fraction": 1,
                "aliquot_type": null
            },
            {
                "source_uuid": "37a563a0-7f57-0130-e345-282066132de2",
                "target_uuid": "42288860-7f57-0130-e345-282066132de2",
                "fraction": 1,
                "aliquot_type": null
            }
        ]
    }
}
    EOD

  # Change the status of extracted_tube tubes to unused. Change the status of 2d tubes to complete


    response = put "/2ea9d600-7f57-0130-e344-282066132de2", <<-EOD
    {
    "items": {
        "extracted_tube_dna": {
            "37669990-7f57-0130-e345-282066132de2": {
                "event": "unuse"
            },
            "37a563a0-7f57-0130-e345-282066132de2": {
                "event": "unuse"
            }
        },
        "name_dna": {
            "41e65bf0-7f57-0130-e345-282066132de2": {
                "event": "complete"
            },
            "42288860-7f57-0130-e345-282066132de2": {
                "event": "complete"
            }
        }
    },
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2"
        },
        "uuid": "2ea9d600-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "in_progress",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_dna": [
                {
                    "uuid": "362fbaa0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "365fd5b0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "by_product_tube_rnap": [
                {
                    "uuid": "368d90c0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "36bb5bd0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "397e9f30-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "39ac3fc0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_dna": [
                {
                    "uuid": "37669990-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "37a563a0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "tube_to_be_extracted_rnap": [
                {
                    "uuid": "38343460-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "38791c40-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_rna": [
                {
                    "uuid": "3915b1c0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "395a39c0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_rna": [
                {
                    "uuid": "3a6019a0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "3a884ee0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "name_rna": [
                {
                    "uuid": "3f2f7110-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "3f551340-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "stock_rna": [
                {
                    "uuid": "401029e0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "name_dna": [
                {
                    "uuid": "41e65bf0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "42288860-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ]
        }
    }
}
    EOD

  # Create a new tube rack 


    response = post "/tube_racks", <<-EOD
    {
    "tube_rack": {
        "user": "username",
        "number_of_columns": 12,
        "number_of_rows": 8,
        "tubes": {
            "A1": "41e65bf0-7f57-0130-e345-282066132de2",
            "A2": "42288860-7f57-0130-e345-282066132de2"
        }
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "tube_rack": {
        "actions": {
            "read": "http://example.org/42c31630-7f57-0130-e345-282066132de2",
            "create": "http://example.org/42c31630-7f57-0130-e345-282066132de2",
            "update": "http://example.org/42c31630-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/42c31630-7f57-0130-e345-282066132de2"
        },
        "uuid": "42c31630-7f57-0130-e345-282066132de2",
        "number_of_rows": 8,
        "number_of_columns": 12,
        "tubes": {
            "A1": {
                "actions": {
                    "read": "http://example.org/41e65bf0-7f57-0130-e345-282066132de2",
                    "create": "http://example.org/41e65bf0-7f57-0130-e345-282066132de2",
                    "update": "http://example.org/41e65bf0-7f57-0130-e345-282066132de2",
                    "delete": "http://example.org/41e65bf0-7f57-0130-e345-282066132de2"
                },
                "uuid": "41e65bf0-7f57-0130-e345-282066132de2",
                "type": null,
                "max_volume": null,
                "aliquots": [
                    {
                        "sample": {
                            "actions": {
                                "read": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                "create": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                "update": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2",
                                "delete": "http://example.org/2ea393c0-7f57-0130-e344-282066132de2"
                            },
                            "uuid": "2ea393c0-7f57-0130-e344-282066132de2",
                            "name": "sample_0"
                        },
                        "type": "DNA",
                        "unit": "mole"
                    }
                ],
                "labels": {
                    "actions": {
                        "read": "http://example.org/41f5ab70-7f57-0130-e345-282066132de2",
                        "create": "http://example.org/41f5ab70-7f57-0130-e345-282066132de2",
                        "update": "http://example.org/41f5ab70-7f57-0130-e345-282066132de2",
                        "delete": "http://example.org/41f5ab70-7f57-0130-e345-282066132de2"
                    },
                    "uuid": "41f5ab70-7f57-0130-e345-282066132de2",
                    "barcode": {
                        "value": "1234567892500",
                        "type": "2d-barcode"
                    }
                }
            },
            "A2": {
                "actions": {
                    "read": "http://example.org/42288860-7f57-0130-e345-282066132de2",
                    "create": "http://example.org/42288860-7f57-0130-e345-282066132de2",
                    "update": "http://example.org/42288860-7f57-0130-e345-282066132de2",
                    "delete": "http://example.org/42288860-7f57-0130-e345-282066132de2"
                },
                "uuid": "42288860-7f57-0130-e345-282066132de2",
                "type": null,
                "max_volume": null,
                "aliquots": [
                    {
                        "sample": {
                            "actions": {
                                "read": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                "create": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                "update": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2",
                                "delete": "http://example.org/2ea423b0-7f57-0130-e344-282066132de2"
                            },
                            "uuid": "2ea423b0-7f57-0130-e344-282066132de2",
                            "name": "sample_1"
                        },
                        "type": "DNA",
                        "unit": "mole"
                    }
                ],
                "labels": {
                    "actions": {
                        "read": "http://example.org/423b3e80-7f57-0130-e345-282066132de2",
                        "create": "http://example.org/423b3e80-7f57-0130-e345-282066132de2",
                        "update": "http://example.org/423b3e80-7f57-0130-e345-282066132de2",
                        "delete": "http://example.org/423b3e80-7f57-0130-e345-282066132de2"
                    },
                    "uuid": "423b3e80-7f57-0130-e345-282066132de2",
                    "barcode": {
                        "value": "1234567892600",
                        "type": "2d-barcode"
                    }
                }
            }
        }
    }
}
    EOD

  # Add the tube rack in the order and start it


    response = put "/2ea9d600-7f57-0130-e344-282066132de2", <<-EOD
    {
    "items": {
        "stock_dna": {
            "42c31630-7f57-0130-e345-282066132de2": {
                "event": "start",
                "batch_uuid": "34a52320-7f57-0130-e345-282066132de2"
            }
        }
    },
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2"
        },
        "uuid": "2ea9d600-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "in_progress",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_dna": [
                {
                    "uuid": "362fbaa0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "365fd5b0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "by_product_tube_rnap": [
                {
                    "uuid": "368d90c0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "36bb5bd0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "397e9f30-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "39ac3fc0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_dna": [
                {
                    "uuid": "37669990-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "37a563a0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "tube_to_be_extracted_rnap": [
                {
                    "uuid": "38343460-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "38791c40-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_rna": [
                {
                    "uuid": "3915b1c0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "395a39c0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_rna": [
                {
                    "uuid": "3a6019a0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "3a884ee0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "name_rna": [
                {
                    "uuid": "3f2f7110-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "3f551340-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "stock_rna": [
                {
                    "uuid": "401029e0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "name_dna": [
                {
                    "uuid": "41e65bf0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "42288860-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "stock_dna": [
                {
                    "uuid": "42c31630-7f57-0130-e345-282066132de2",
                    "status": "in_progress",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ]
        }
    }
}
    EOD

  # Change the type of the rube rack to complete


    response = put "/2ea9d600-7f57-0130-e344-282066132de2", <<-EOD
    {
    "items": {
        "stock_dna": {
            "42c31630-7f57-0130-e345-282066132de2": {
                "event": "complete"
            }
        }
    },
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2"
        },
        "uuid": "2ea9d600-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "in_progress",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_dna": [
                {
                    "uuid": "362fbaa0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "365fd5b0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "by_product_tube_rnap": [
                {
                    "uuid": "368d90c0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "36bb5bd0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "397e9f30-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "39ac3fc0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_dna": [
                {
                    "uuid": "37669990-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "37a563a0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "tube_to_be_extracted_rnap": [
                {
                    "uuid": "38343460-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "38791c40-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_rna": [
                {
                    "uuid": "3915b1c0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "395a39c0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_rna": [
                {
                    "uuid": "3a6019a0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "3a884ee0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "name_rna": [
                {
                    "uuid": "3f2f7110-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "3f551340-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "stock_rna": [
                {
                    "uuid": "401029e0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "name_dna": [
                {
                    "uuid": "41e65bf0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "42288860-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "stock_dna": [
                {
                    "uuid": "42c31630-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ]
        }
    }
}
    EOD



  # Create new tubes


    response = post "/tubes", <<-EOD
    {
    "tube": {
        "user": "username"
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "tube": {
        "actions": {
            "read": "http://example.org/4342d570-7f57-0130-e345-282066132de2",
            "create": "http://example.org/4342d570-7f57-0130-e345-282066132de2",
            "update": "http://example.org/4342d570-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/4342d570-7f57-0130-e345-282066132de2"
        },
        "uuid": "4342d570-7f57-0130-e345-282066132de2",
        "type": null,
        "max_volume": null,
        "aliquots": [

        ]
    }
}
    EOD



    response = post "/labellables", <<-EOD
    {
    "labellable": {
        "user": "username",
        "name": "4342d570-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567892700",
                "type": "2d-barcode"
            }
        }
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "labellable": {
        "actions": {
            "read": "http://example.org/4359fcb0-7f57-0130-e345-282066132de2",
            "create": "http://example.org/4359fcb0-7f57-0130-e345-282066132de2",
            "update": "http://example.org/4359fcb0-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/4359fcb0-7f57-0130-e345-282066132de2"
        },
        "uuid": "4359fcb0-7f57-0130-e345-282066132de2",
        "name": "4342d570-7f57-0130-e345-282066132de2",
        "type": "resource",
        "labels": {
            "barcode": {
                "value": "1234567892700",
                "type": "2d-barcode"
            }
        }
    }
}
    EOD

  # Add the 2d tubes in the order and start them


    response = put "/2eaaf660-7f57-0130-e344-282066132de2", <<-EOD
    {
    "items": {
        "name_dna": {
            "4342d570-7f57-0130-e345-282066132de2": {
                "event": "start",
                "batch_uuid": "34a52320-7f57-0130-e345-282066132de2"
            }
        }
    },
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2"
        },
        "uuid": "2eaaf660-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "in_progress",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_dna": [
                {
                    "uuid": "3bb68680-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "by_product_tube_rnap": [
                {
                    "uuid": "3be83770-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "3dc69b90-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_dna": [
                {
                    "uuid": "3c744720-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "tube_to_be_extracted_rnap": [
                {
                    "uuid": "3d0b15d0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_rna": [
                {
                    "uuid": "3d9bd4f0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_rna": [
                {
                    "uuid": "3e795c30-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "name_rna": [
                {
                    "uuid": "409cf0e0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "stock_rna": [
                {
                    "uuid": "4167fda0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "name_dna": [
                {
                    "uuid": "4342d570-7f57-0130-e345-282066132de2",
                    "status": "in_progress",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ]
        }
    }
}
    EOD

  # Transfer extracted tubes into 2D tubes


    response = post "/actions/transfer_tubes_to_tubes", <<-EOD
    {
    "transfer_tubes_to_tubes": {
        "user": "username",
        "transfers": [
            {
                "source_uuid": "3c744720-7f57-0130-e345-282066132de2",
                "target_uuid": "4342d570-7f57-0130-e345-282066132de2",
                "fraction": 1,
                "aliquot_type": null
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
        "user": "username",
        "application": "application",
        "result": {
            "sources": [
                {
                    "tube": {
                        "actions": {
                            "read": "http://example.org/3c744720-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/3c744720-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/3c744720-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/3c744720-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "3c744720-7f57-0130-e345-282066132de2",
                        "type": null,
                        "max_volume": null,
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea4b420-7f57-0130-e344-282066132de2",
                                    "name": "sample_2"
                                },
                                "type": "DNA",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/3c899370-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/3c899370-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/3c899370-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/3c899370-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "3c899370-7f57-0130-e345-282066132de2",
                            "barcode": {
                                "value": "1234567891700",
                                "type": "ean13-barcode"
                            }
                        }
                    }
                }
            ],
            "targets": [
                {
                    "tube": {
                        "actions": {
                            "read": "http://example.org/4342d570-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/4342d570-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/4342d570-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/4342d570-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "4342d570-7f57-0130-e345-282066132de2",
                        "type": null,
                        "max_volume": null,
                        "aliquots": [
                            {
                                "sample": {
                                    "actions": {
                                        "read": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "create": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "update": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                        "delete": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2"
                                    },
                                    "uuid": "2ea4b420-7f57-0130-e344-282066132de2",
                                    "name": "sample_2"
                                },
                                "type": "DNA",
                                "unit": "mole"
                            }
                        ],
                        "labels": {
                            "actions": {
                                "read": "http://example.org/4359fcb0-7f57-0130-e345-282066132de2",
                                "create": "http://example.org/4359fcb0-7f57-0130-e345-282066132de2",
                                "update": "http://example.org/4359fcb0-7f57-0130-e345-282066132de2",
                                "delete": "http://example.org/4359fcb0-7f57-0130-e345-282066132de2"
                            },
                            "uuid": "4359fcb0-7f57-0130-e345-282066132de2",
                            "barcode": {
                                "value": "1234567892700",
                                "type": "2d-barcode"
                            }
                        }
                    }
                }
            ]
        },
        "transfers": [
            {
                "source_uuid": "3c744720-7f57-0130-e345-282066132de2",
                "target_uuid": "4342d570-7f57-0130-e345-282066132de2",
                "fraction": 1,
                "aliquot_type": null
            }
        ]
    }
}
    EOD

  # Change the status of extracted_tube tubes to unused. Change the status of 2d tubes to complete


    response = put "/2eaaf660-7f57-0130-e344-282066132de2", <<-EOD
    {
    "items": {
        "extracted_tube_dna": {
            "3c744720-7f57-0130-e345-282066132de2": {
                "event": "unuse"
            }
        },
        "name_dna": {
            "4342d570-7f57-0130-e345-282066132de2": {
                "event": "complete"
            }
        }
    },
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2"
        },
        "uuid": "2eaaf660-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "in_progress",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_dna": [
                {
                    "uuid": "3bb68680-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "by_product_tube_rnap": [
                {
                    "uuid": "3be83770-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "3dc69b90-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_dna": [
                {
                    "uuid": "3c744720-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "tube_to_be_extracted_rnap": [
                {
                    "uuid": "3d0b15d0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_rna": [
                {
                    "uuid": "3d9bd4f0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_rna": [
                {
                    "uuid": "3e795c30-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "name_rna": [
                {
                    "uuid": "409cf0e0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "stock_rna": [
                {
                    "uuid": "4167fda0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "name_dna": [
                {
                    "uuid": "4342d570-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ]
        }
    }
}
    EOD

  # Create a new tube rack 


    response = post "/tube_racks", <<-EOD
    {
    "tube_rack": {
        "user": "username",
        "number_of_columns": 12,
        "number_of_rows": 8,
        "tubes": {
            "A1": "4342d570-7f57-0130-e345-282066132de2"
        }
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "tube_rack": {
        "actions": {
            "read": "http://example.org/43d17810-7f57-0130-e345-282066132de2",
            "create": "http://example.org/43d17810-7f57-0130-e345-282066132de2",
            "update": "http://example.org/43d17810-7f57-0130-e345-282066132de2",
            "delete": "http://example.org/43d17810-7f57-0130-e345-282066132de2"
        },
        "uuid": "43d17810-7f57-0130-e345-282066132de2",
        "number_of_rows": 8,
        "number_of_columns": 12,
        "tubes": {
            "A1": {
                "actions": {
                    "read": "http://example.org/4342d570-7f57-0130-e345-282066132de2",
                    "create": "http://example.org/4342d570-7f57-0130-e345-282066132de2",
                    "update": "http://example.org/4342d570-7f57-0130-e345-282066132de2",
                    "delete": "http://example.org/4342d570-7f57-0130-e345-282066132de2"
                },
                "uuid": "4342d570-7f57-0130-e345-282066132de2",
                "type": null,
                "max_volume": null,
                "aliquots": [
                    {
                        "sample": {
                            "actions": {
                                "read": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                "create": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                "update": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2",
                                "delete": "http://example.org/2ea4b420-7f57-0130-e344-282066132de2"
                            },
                            "uuid": "2ea4b420-7f57-0130-e344-282066132de2",
                            "name": "sample_2"
                        },
                        "type": "DNA",
                        "unit": "mole"
                    }
                ],
                "labels": {
                    "actions": {
                        "read": "http://example.org/4359fcb0-7f57-0130-e345-282066132de2",
                        "create": "http://example.org/4359fcb0-7f57-0130-e345-282066132de2",
                        "update": "http://example.org/4359fcb0-7f57-0130-e345-282066132de2",
                        "delete": "http://example.org/4359fcb0-7f57-0130-e345-282066132de2"
                    },
                    "uuid": "4359fcb0-7f57-0130-e345-282066132de2",
                    "barcode": {
                        "value": "1234567892700",
                        "type": "2d-barcode"
                    }
                }
            }
        }
    }
}
    EOD

  # Add the tube rack in the order and start it


    response = put "/2eaaf660-7f57-0130-e344-282066132de2", <<-EOD
    {
    "items": {
        "stock_dna": {
            "43d17810-7f57-0130-e345-282066132de2": {
                "event": "start",
                "batch_uuid": "34a52320-7f57-0130-e345-282066132de2"
            }
        }
    },
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2"
        },
        "uuid": "2eaaf660-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "in_progress",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_dna": [
                {
                    "uuid": "3bb68680-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "by_product_tube_rnap": [
                {
                    "uuid": "3be83770-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "3dc69b90-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_dna": [
                {
                    "uuid": "3c744720-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "tube_to_be_extracted_rnap": [
                {
                    "uuid": "3d0b15d0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_rna": [
                {
                    "uuid": "3d9bd4f0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_rna": [
                {
                    "uuid": "3e795c30-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "name_rna": [
                {
                    "uuid": "409cf0e0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "stock_rna": [
                {
                    "uuid": "4167fda0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "name_dna": [
                {
                    "uuid": "4342d570-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "stock_dna": [
                {
                    "uuid": "43d17810-7f57-0130-e345-282066132de2",
                    "status": "in_progress",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ]
        }
    }
}
    EOD

  # Change the type of the rube rack to complete


    response = put "/2eaaf660-7f57-0130-e344-282066132de2", <<-EOD
    {
    "items": {
        "stock_dna": {
            "43d17810-7f57-0130-e345-282066132de2": {
                "event": "complete"
            }
        }
    },
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2"
        },
        "uuid": "2eaaf660-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "in_progress",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_dna": [
                {
                    "uuid": "3bb68680-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "by_product_tube_rnap": [
                {
                    "uuid": "3be83770-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "3dc69b90-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_dna": [
                {
                    "uuid": "3c744720-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "tube_to_be_extracted_rnap": [
                {
                    "uuid": "3d0b15d0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_rna": [
                {
                    "uuid": "3d9bd4f0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_rna": [
                {
                    "uuid": "3e795c30-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "name_rna": [
                {
                    "uuid": "409cf0e0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "stock_rna": [
                {
                    "uuid": "4167fda0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "name_dna": [
                {
                    "uuid": "4342d570-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "stock_dna": [
                {
                    "uuid": "43d17810-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ]
        }
    }
}
    EOD





    response = put "/2ea9d600-7f57-0130-e344-282066132de2", <<-EOD
    {
    "event": "complete",
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2ea9d600-7f57-0130-e344-282066132de2"
        },
        "uuid": "2ea9d600-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "completed",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea58a10-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "2ea6d7b0-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_dna": [
                {
                    "uuid": "362fbaa0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "365fd5b0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "by_product_tube_rnap": [
                {
                    "uuid": "368d90c0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "36bb5bd0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "397e9f30-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "39ac3fc0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_dna": [
                {
                    "uuid": "37669990-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "37a563a0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "tube_to_be_extracted_rnap": [
                {
                    "uuid": "38343460-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "38791c40-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_rna": [
                {
                    "uuid": "3915b1c0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "395a39c0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_rna": [
                {
                    "uuid": "3a6019a0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "3a884ee0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "name_rna": [
                {
                    "uuid": "3f2f7110-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "3f551340-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "stock_rna": [
                {
                    "uuid": "401029e0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "name_dna": [
                {
                    "uuid": "41e65bf0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "42288860-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "stock_dna": [
                {
                    "uuid": "42c31630-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ]
        }
    }
}
    EOD





    response = put "/2eaaf660-7f57-0130-e344-282066132de2", <<-EOD
    {
    "event": "complete",
    "user": "username"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "order": {
        "actions": {
            "read": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "create": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "update": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2",
            "delete": "http://example.org/2eaaf660-7f57-0130-e344-282066132de2"
        },
        "uuid": "2eaaf660-7f57-0130-e344-282066132de2",
        "pipeline": "DNA+RNA manual extraction",
        "status": "completed",
        "parameters": {
        },
        "state": {
        },
        "cost_code": "cost code",
        "creator": {
            "actions": {
                "read": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2d340-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2d340-7f57-0130-e344-282066132de2"
        },
        "study": {
            "actions": {
                "read": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "create": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "update": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2",
                "delete": "http://example.org/2ea2dc40-7f57-0130-e344-282066132de2"
            },
            "uuid": "2ea2dc40-7f57-0130-e344-282066132de2"
        },
        "items": {
            "tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_tube_to_be_extracted_nap": [
                {
                    "uuid": "2ea83c50-7f57-0130-e344-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_dna": [
                {
                    "uuid": "3bb68680-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "by_product_tube_rnap": [
                {
                    "uuid": "3be83770-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                },
                {
                    "uuid": "3dc69b90-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_dna": [
                {
                    "uuid": "3c744720-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "tube_to_be_extracted_rnap": [
                {
                    "uuid": "3d0b15d0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "binding_spin_column_rna": [
                {
                    "uuid": "3d9bd4f0-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "extracted_tube_rna": [
                {
                    "uuid": "3e795c30-7f57-0130-e345-282066132de2",
                    "status": "unused",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "name_rna": [
                {
                    "uuid": "409cf0e0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "stock_rna": [
                {
                    "uuid": "4167fda0-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "name_dna": [
                {
                    "uuid": "4342d570-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ],
            "stock_dna": [
                {
                    "uuid": "43d17810-7f57-0130-e345-282066132de2",
                    "status": "done",
                    "batch": {
                        "actions": {
                            "read": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "create": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "update": "http://example.org/34a52320-7f57-0130-e345-282066132de2",
                            "delete": "http://example.org/34a52320-7f57-0130-e345-282066132de2"
                        },
                        "uuid": "34a52320-7f57-0130-e345-282066132de2",
                        "process": null,
                        "kit": "1234567891011"
                    }
                }
            ]
        }
    }
}
    EOD

  end
end
