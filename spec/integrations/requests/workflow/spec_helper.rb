require "integrations/requests/spec_helper"
# This file will be required by
# all file in this directory and subdirectory

shared_context "setup_s2_environment_for_dna_rna_manual_extraction" do
  let(:user_uuid) { "c5657b40-743a-0130-e1ba-282066132de2" }
  let(:study_uuid) { "c5658890-743a-0130-e1ba-282066132de2" }
  let(:tube_uuids) { ["c566aa00-743a-0130-e1ba-282066132de2", "c5680c20-743a-0130-e1ba-282066132de2", "c5697450-743a-0130-e1ba-282066132de2"] }
  let(:labellable_uuids) { ["c566bc20-743a-0130-e1ba-282066132de2", "c5681bd0-743a-0130-e1ba-282066132de2", "c5698510-743a-0130-e1ba-282066132de2"] }
  let(:order_uuids) { ["c56b6ae0-743a-0130-e1ba-282066132de2", "c56cc190-743a-0130-e1ba-282066132de2"] }

  let(:source_tube_barcodes) { ["1220017279667", "1220017279668", "1220017279669"] }

  # Needed for the order creation
  # - a valid study uuid
  # - a valid user uuid
  # Add a user and a study in the core
  let!(:order_config) { 
    user = Lims::Core::Organization::User.new
    study = Lims::Core::Organization::Study.new
    save_with_uuid({user => user_uuid, study => study_uuid})
    {:user_uuid => user_uuid, :study_uuid => study_uuid}
  }

  # Setup the orders for dna_rna manual extraction pipeline
  # 2 tubes in 1 order
  # 1 tube in 1 order
  # Create the tubes for dna+rna manual extraction orders
  # Barcode each tube
  let!(:tube_manual_uuids) {
    [0, 1, 2].map! do |i|
      tube = Lims::Core::Laboratory::Tube.new
      sample = Lims::Core::Laboratory::Sample.new(:name => "sample_#{i}") 
      tube << Lims::Core::Laboratory::Aliquot.new(:sample => sample,
                                                  :type => "NA+P",
                                                  :quantity => 1000)
      labellable = Lims::Core::Laboratory::Labellable.new(:name => tube_uuids[i], :type => "resource")
      labellable["barcode"] = Lims::Core::Laboratory::Labellable::Label.new(:type => "ean13-barcode", 
                                                                            :value => source_tube_barcodes[i])
      save_with_uuid({tube => tube_uuids[i], labellable => labellable_uuids[i]})
    end
  }

  # Create orders
  # First order with 2 tubes, Second order with 1 tube
  let!(:create_order) {
    [[tube_manual_uuids[0], tube_manual_uuids[1]], [tube_manual_uuids[2]]].each_with_index do |source_tubes, index|
      order = Lims::Core::Organization::Order.new(:creator => order_config[:user_uuid],
                                                  :study => order_config[:study_uuid],
                                                  :pipeline => "DNA+RNA manual extraction",
                                                  :cost_code => "cost code")
      order.add_source("tube_to_be_extracted_na+p", source_tubes)

      save_with_uuid({order => order_uuids[index]})
    end
  }
end
