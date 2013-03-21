require 'integrations/spec_helper'
require 'integrations/plate_resource_shared'
require 'integrations/lab_resource_shared'

require 'lims-api/resource_shared'

describe Lims::Core::Actions::TransferPlatesToPlates do
  include_context "use core context service"
  include_context "JSON"
  include_context "use generated uuid"

  let(:url) { "/actions/transfer_plates_to_plates" }

  context "transfer from plate(s)-like to plate(s)-like" do
    context "from empty plate-like" do
      let(:parameters) { { :transfer_plates_to_plates => {} } }
      let(:expected_json) { {"errors" => {:transfers => "invalid"} } }

      it_behaves_like "an invalid core action", 422 # Unprocessable entity
    end

    include_context "has standard dimensions"
    include_context "for creating a plate-like with aliquots and solvent in it"
    include_context "with source elements"
    include_context "with target elements"

    # test data fixtures
    let(:aliquot_type_NA) { "NA" }
    let(:aliquot_type_DNA) { "DNA" }
    let(:aliquot_type_RNA) { "RNA" }
    let(:aliquot_type_sample) { "sample" }
    let(:unit_type) { "mole" }
    let(:aliquot_type) { 'sample' }
    let(:source_locations) { ["A1", "C3"] }
    let(:target_locations) { ["B2", "D4"] }
    let(:sample1_name) { "sample for #{source_locations[0]}"}
    let(:sample2_name) { "sample for #{source_locations[1]}"}
    let(:sample_uuid) { '11111111-2222-3333-4444-555555555555' }
    let(:sample_data) { [ {sample_uuid => sample1_name},
                          {sample_uuid => sample2_name}
      ]
    }
    let(:samples) { create_samples(sample_data) }

    let(:source_aliquot_quantity) { 60.0 }
    let(:target_aliquot_quantity1) { 40.0 }
    let(:target_aliquot_quantity2) { 40.0 }
    let(:target_aliquot_type1) { aliquot_type_DNA }
    let(:target_aliquot_type2) { aliquot_type_RNA }

    context "from plates with samples" do
      let(:source_plate1_uuid) { create_plate_with_aliquots_and_solvent(
        '11111111-2222-3333-1111-000000000000',
        samples[0],
        source_locations[0]
        )
      }
      let(:source_plate2_uuid) { create_plate_with_aliquots_and_solvent(
        '11111111-2222-3333-1111-000000000001',
        samples[1],
        source_locations[1]
        )
      }

      context "to existing target plates" do
        let(:target_plate1_uuid) { new_empty_plate('11111111-2222-3333-1111-000000000002') }
        let(:target_plate2_uuid) { new_empty_plate('11111111-2222-3333-1111-000000000003') }

        let(:transfers) { [
          { "source_uuid" => source_plate1_uuid,
            "source_location" => source_locations[0],
            "target_uuid" => target_plate1_uuid,
            "target_location" => target_locations[0],
            "fraction" => 0.4,
            "aliquot_type" => aliquot_type_DNA
          },
          { "source_uuid" => source_plate2_uuid,
            "source_location" => source_locations[1],
            "target_uuid" => target_plate2_uuid,
            "target_location" => target_locations[1],
            "fraction" => 0.4,
            "aliquot_type" => aliquot_type_RNA
          }
          ] 
        }
        let(:parameters) { { :transfer_plates_to_plates => { :transfers => transfers } } }

        let(:expected_json) {
          source_plate1_url = "http://example.org/#{source_plate1_uuid}"
          source_plate2_url = "http://example.org/#{source_plate2_uuid}"
          target_plate1_url = "http://example.org/#{target_plate1_uuid}"
          target_plate2_url = "http://example.org/#{target_plate2_uuid}"
          { :transfer_plates_to_plates =>
            { :actions => {},
              :user => "user",
              :application => "application",
              :result => {
                :sources => [
                  { "plate" => {
                    "actions" => {
                      "read" => source_plate1_url,
                      "create" => source_plate1_url,
                      "update" => source_plate1_url,
                      "delete" => source_plate1_url
                    },
                    "uuid" => source_plate1_uuid,
                    "type"=>nil,
                    "number_of_rows" => number_of_rows,
                    "number_of_columns" => number_of_columns,
                    "wells"=> source_elements1 }
                  },
                  { "plate" => {
                    "actions" => {
                      "read" => source_plate2_url,
                      "create" => source_plate2_url,
                      "update" => source_plate2_url,
                      "delete" => source_plate2_url
                    },
                    "uuid" => source_plate2_uuid,
                    "type"=>nil,
                    "number_of_rows" => number_of_rows,
                    "number_of_columns" => number_of_columns,
                    "wells"=> source_elements2 }
                  }
                ],
                :targets => [
                  { "plate" => {
                    "actions" => {
                      "read" => target_plate1_url,
                      "create" => target_plate1_url,
                      "update" => target_plate1_url,
                      "delete" => target_plate1_url
                    },
                    "uuid" => target_plate1_uuid,
                    "type"=>nil,
                    "number_of_rows" => number_of_rows,
                    "number_of_columns" => number_of_columns,
                    "wells"=> target_elements1 }
                  },
                  { "plate" => {
                    "actions" => {
                      "read" => target_plate2_url,
                      "create" => target_plate2_url,
                      "update" => target_plate2_url,
                      "delete" => target_plate2_url
                    },
                    "uuid" => target_plate2_uuid,
                    "type"=>nil,
                    "number_of_rows" => number_of_rows,
                    "number_of_columns" => number_of_columns,
                    "wells"=> target_elements2 }
                  }
                ]
              },
              :transfers => transfers
            }
          }
        }

        it_behaves_like "a valid core action"
      end

      context "to existing target gels" do
        let(:target_gel1_uuid) { new_empty_gel('11111111-2222-3333-1111-000000000002') }
        let(:target_gel2_uuid) { new_empty_gel('11111111-2222-3333-1111-000000000003') }

        let(:transfers) { [
          { "source_uuid" => source_plate1_uuid,
            "source_location" => source_locations[0],
            "target_uuid" => target_gel1_uuid,
            "target_location" => target_locations[0],
            "fraction" => 0.4,
            "aliquot_type" => aliquot_type_DNA
          },
          { "source_uuid" => source_plate2_uuid,
            "source_location" => source_locations[1],
            "target_uuid" => target_gel2_uuid,
            "target_location" => target_locations[1],
            "fraction" => 0.4,
            "aliquot_type" => aliquot_type_RNA
          }
          ]
        }
        let(:parameters) { { :transfer_plates_to_plates => { :transfers => transfers } } }

        let(:expected_json) {
          source_plate1_url = "http://example.org/#{source_plate1_uuid}"
          source_plate2_url = "http://example.org/#{source_plate2_uuid}"
          target_gel1_url = "http://example.org/#{target_gel1_uuid}"
          target_gel2_url = "http://example.org/#{target_gel2_uuid}"
          { :transfer_plates_to_plates =>
            { :actions => {},
              :user => "user",
              :application => "application",
              :result => {
                :sources => [
                  { "plate" => {
                    "actions" => {
                      "read" => source_plate1_url,
                      "create" => source_plate1_url,
                      "update" => source_plate1_url,
                      "delete" => source_plate1_url
                    },
                    "uuid" => source_plate1_uuid,
                    "type"=>nil,
                    "number_of_rows" => number_of_rows,
                    "number_of_columns" => number_of_columns,
                    "wells"=> source_elements1 }
                  },
                  { "plate" => {
                    "actions" => {
                      "read" => source_plate2_url,
                      "create" => source_plate2_url,
                      "update" => source_plate2_url,
                      "delete" => source_plate2_url
                    },
                    "uuid" => source_plate2_uuid,
                    "type"=>nil,
                    "number_of_rows" => number_of_rows,
                    "number_of_columns" => number_of_columns,
                    "wells"=> source_elements2 }
                  }
                ],
                :targets => [
                  { "gel" => {
                    "actions" => {
                      "read" => target_gel1_url,
                      "create" => target_gel1_url,
                      "update" => target_gel1_url,
                      "delete" => target_gel1_url
                    },
                    "uuid" => target_gel1_uuid,
                    "number_of_rows" => number_of_rows,
                    "number_of_columns" => number_of_columns,
                    "windows"=> target_elements1 }
                  },
                  { "gel" => {
                    "actions" => {
                      "read" => target_gel2_url,
                      "create" => target_gel2_url,
                      "update" => target_gel2_url,
                      "delete" => target_gel2_url
                    },
                    "uuid" => target_gel2_uuid,
                    "number_of_rows" => number_of_rows,
                    "number_of_columns" => number_of_columns,
                    "windows"=> target_elements2 }
                  }
                ]
              },
              :transfers => transfers
            }
          }
        }

        it_behaves_like "a valid core action"
      end
    end

    context "from tube-racks with samples" do
      let(:source_rack1_uuid) { create_tube_rack_with_aliquots_and_solvent(
        '11111111-2222-3333-1111-000000000000',
        samples[0],
        source_locations[0]
        )
      }
      let(:source_rack2_uuid) { create_tube_rack_with_aliquots_and_solvent(
        '11111111-2222-3333-1111-000000000001',
        samples[1],
        source_locations[1]
        )
      }

      context "to existing target plates" do
        let(:target_plate1_uuid) { new_empty_plate('11111111-2222-3333-1111-000000000002') }
        let(:target_plate2_uuid) { new_empty_plate('11111111-2222-3333-1111-000000000003') }

        let(:transfers) { [
          { "source_uuid" => source_rack1_uuid,
            "source_location" => source_locations[0],
            "target_uuid" => target_plate1_uuid,
            "target_location" => target_locations[0],
            "fraction" => 0.4,
            "aliquot_type" => aliquot_type_DNA
          },
          { "source_uuid" => source_rack2_uuid,
            "source_location" => source_locations[1],
            "target_uuid" => target_plate2_uuid,
            "target_location" => target_locations[1],
            "fraction" => 0.4,
            "aliquot_type" => aliquot_type_RNA
          }
          ]
        }
        let(:parameters) { { :transfer_plates_to_plates => { :transfers => transfers } } }

        let(:expected_json) {
          source_rack1_url = "http://example.org/#{source_rack1_uuid}"
          source_rack2_url = "http://example.org/#{source_rack2_uuid}"
          target_plate1_url = "http://example.org/#{target_plate1_uuid}"
          target_plate2_url = "http://example.org/#{target_plate2_uuid}"
          { :transfer_plates_to_plates =>
            { :actions => {},
              :user => "user",
              :application => "application",
              :result => {
                :sources => [
                  { "tube_rack" => {
                    "actions" => {
                      "read" => source_rack1_url,
                      "create" => source_rack1_url,
                      "update" => source_rack1_url,
                      "delete" => source_rack1_url
                    },
                    "uuid" => source_rack1_uuid,
                    "number_of_rows" => number_of_rows,
                    "number_of_columns" => number_of_columns,
                    "tubes"=> tube_rack_source_elements1 }
                  },
                  { "tube_rack" => {
                    "actions" => {
                      "read" => source_rack2_url,
                      "create" => source_rack2_url,
                      "update" => source_rack2_url,
                      "delete" => source_rack2_url
                    },
                    "uuid" => source_rack2_uuid,
                    "number_of_rows" => number_of_rows,
                    "number_of_columns" => number_of_columns,
                    "tubes"=> tube_rack_source_elements2 }
                  }
                ],
                :targets => [
                  { "plate" => {
                    "actions" => {
                      "read" => target_plate1_url,
                      "create" => target_plate1_url,
                      "update" => target_plate1_url,
                      "delete" => target_plate1_url
                    },
                    "uuid" => target_plate1_uuid,
                    "type"=>nil,
                    "number_of_rows" => number_of_rows,
                    "number_of_columns" => number_of_columns,
                    "wells"=> target_elements1 }
                  },
                  { "plate" => {
                    "actions" => {
                      "read" => target_plate2_url,
                      "create" => target_plate2_url,
                      "update" => target_plate2_url,
                      "delete" => target_plate2_url
                    },
                    "uuid" => target_plate2_uuid,
                    "type"=>nil,
                    "number_of_rows" => number_of_rows,
                    "number_of_columns" => number_of_columns,
                    "wells"=> target_elements2 }
                  }
                ]
              },
              :transfers => transfers
            }
          }
        }

        it_behaves_like "a valid core action"
      end

      context "to existing target racks" do
        let(:target_rack1_uuid) { new_tube_rack_with_empty_tubes('11111111-2222-3333-1111-000000000002',
                                [target_locations[0]])
        }
        let(:target_rack2_uuid) { new_tube_rack_with_empty_tubes('11111111-2222-3333-1111-000000000003',
                                [target_locations[1]])
        }

        let(:transfers) { [
          { "source_uuid" => source_rack1_uuid,
            "source_location" => source_locations[0],
            "target_uuid" => target_rack1_uuid,
            "target_location" => target_locations[0],
            "fraction" => 0.4,
            "aliquot_type" => aliquot_type_DNA
          },
          { "source_uuid" => source_rack2_uuid,
            "source_location" => source_locations[1],
            "target_uuid" => target_rack2_uuid,
            "target_location" => target_locations[1],
            "fraction" => 0.4,
            "aliquot_type" => aliquot_type_RNA
          }
          ]
        }
        let(:parameters) { { :transfer_plates_to_plates => { :transfers => transfers } } }

        let(:expected_json) {
          source_rack1_url = "http://example.org/#{source_rack1_uuid}"
          source_rack2_url = "http://example.org/#{source_rack2_uuid}"
          target_rack1_url = "http://example.org/#{target_rack1_uuid}"
          target_rack2_url = "http://example.org/#{target_rack2_uuid}"
          { :transfer_plates_to_plates =>
            { :actions => {},
              :user => "user",
              :application => "application",
              :result => {
                :sources => [
                  { "tube_rack" => {
                    "actions" => {
                      "read" => source_rack1_url,
                      "create" => source_rack1_url,
                      "update" => source_rack1_url,
                      "delete" => source_rack1_url
                    },
                    "uuid" => source_rack1_uuid,
                    "number_of_rows" => number_of_rows,
                    "number_of_columns" => number_of_columns,
                    "tubes"=> tube_rack_source_elements1 }
                  },
                  { "tube_rack" => {
                    "actions" => {
                      "read" => source_rack2_url,
                      "create" => source_rack2_url,
                      "update" => source_rack2_url,
                      "delete" => source_rack2_url
                    },
                    "uuid" => source_rack2_uuid,
                    "number_of_rows" => number_of_rows,
                    "number_of_columns" => number_of_columns,
                    "tubes"=> tube_rack_source_elements2 }
                  }
                ],
                :targets => [
                  { "tube_rack" => {
                    "actions" => {
                      "read" => target_rack1_url,
                      "create" => target_rack1_url,
                      "update" => target_rack1_url,
                      "delete" => target_rack1_url
                    },
                    "uuid" => target_rack1_uuid,
                    "number_of_rows" => number_of_rows,
                    "number_of_columns" => number_of_columns,
                    "tubes"=> tube_rack_target_elements1 }
                  },
                  { "tube_rack" => {
                    "actions" => {
                      "read" => target_rack2_url,
                      "create" => target_rack2_url,
                      "update" => target_rack2_url,
                      "delete" => target_rack2_url
                    },
                    "uuid" => target_rack2_uuid,
                    "number_of_rows" => number_of_rows,
                    "number_of_columns" => number_of_columns,
                    "tubes"=> tube_rack_target_elements2 }
                  }
                ]
              },
              :transfers => transfers
            }
          }
        }

        it_behaves_like "a valid core action"
      end
    end

    context "from a tube-rack and a plate with samples", :focus => true do
      let(:source_rack1_uuid) { create_tube_rack_with_aliquots_and_solvent(
        '11111111-2222-3333-1111-000000000000',
        samples[0],
        source_locations[0]
        )
      }
      let(:source_plate1_uuid) { create_plate_with_aliquots_and_solvent(
        '11111111-2222-3333-1111-000000000001',
        samples[1],
        source_locations[1]
        )
      }
      context "to existing target plate" do
        let(:target_plate1_uuid) { new_empty_plate('11111111-2222-3333-1111-000000000002') }

        let(:transfers) { [
          { "source_uuid" => source_rack1_uuid,
            "source_location" => source_locations[0],
            "target_uuid" => target_plate1_uuid,
            "target_location" => target_locations[0],
            "fraction" => 0.4,
            "aliquot_type" => aliquot_type_DNA
          },
          { "source_uuid" => source_plate1_uuid,
            "source_location" => source_locations[1],
            "target_uuid" => target_plate1_uuid,
            "target_location" => target_locations[1],
            "fraction" => 0.4,
            "aliquot_type" => aliquot_type_RNA
          }
          ]
        }
        let(:parameters) { { :transfer_plates_to_plates => { :transfers => transfers } } }

        let(:expected_json) {
          source_rack1_url = "http://example.org/#{source_rack1_uuid}"
          source_plate1_url = "http://example.org/#{source_plate1_uuid}"
          target_plate1_url = "http://example.org/#{target_plate1_uuid}"
          { :transfer_plates_to_plates =>
            { :actions => {},
              :user => "user",
              :application => "application",
              :result => {
                :sources => [
                  { "tube_rack" => {
                    "actions" => {
                      "read" => source_rack1_url,
                      "create" => source_rack1_url,
                      "update" => source_rack1_url,
                      "delete" => source_rack1_url
                    },
                    "uuid" => source_rack1_uuid,
                    "number_of_rows" => number_of_rows,
                    "number_of_columns" => number_of_columns,
                    "tubes"=> tube_rack_source_elements1 }
                  },
                  { "plate" => {
                    "actions" => {
                      "read" => source_plate1_url,
                      "create" => source_plate1_url,
                      "update" => source_plate1_url,
                      "delete" => source_plate1_url
                    },
                    "uuid" => source_plate1_uuid,
                    "type"=>nil,
                    "number_of_rows" => number_of_rows,
                    "number_of_columns" => number_of_columns,
                    "wells"=> source_elements2 }
                  }
                ],
                :targets => [
                  { "plate" => {
                    "actions" => {
                      "read" => target_plate1_url,
                      "create" => target_plate1_url,
                      "update" => target_plate1_url,
                      "delete" => target_plate1_url
                    },
                    "uuid" => target_plate1_uuid,
                    "type"=>nil,
                    "number_of_rows" => number_of_rows,
                    "number_of_columns" => number_of_columns,
                    "wells"=> target_elements_B2_D4 }
                  }
                ]
              },
              :transfers => transfers
            }
          }
        }

        it_behaves_like "a valid core action"
        end
    end
  end
end
