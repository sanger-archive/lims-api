require "integrations/requests/spec_helper"
# This file will be required by
# all file in this directory and subdirectory

shared_context "setup_s2_environment_for_dna_rna_manual_extraction" do
  let(:user_uuid) { "ebda2af0-744a-0130-e1da-282066132de2" }
  let(:study_uuid) { "ebda4580-744a-0130-e1da-282066132de2" }
  let(:sample_uuids) { ["ebdb9490-744a-0130-e1da-282066132de2", "ebddfb00-744a-0130-e1da-282066132de2", "ebdf14a0-744a-0130-e1da-282066132de2"] }
  let(:tube_uuids) { ["ebe04b50-744a-0130-e1da-282066132de2", "ebe2d310-744a-0130-e1da-282066132de2", "ebe55ab0-744a-0130-e1da-282066132de2"] }
  let(:labellable_uuids) { ["ebe06630-744a-0130-e1da-282066132de2", "ebe2e9f0-744a-0130-e1da-282066132de2", "ebe57030-744a-0130-e1da-282066132de2"] }
  let(:order_uuids) { ["ebe7bf00-744a-0130-e1da-282066132de2", "ebe95980-744a-0130-e1da-282066132de2"] }

  let(:source_tube_barcodes) { ["1220017279667", "1220017279668", "1220017279669"] }

  # Needed for the order creation
  # - a valid study uuid
  # - a valid user uuid
  # Add a user and a study in the core
  let(:order_config) { 
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
  let(:create_samples) {
    [0, 1, 2].each do |i|
      sample = Lims::Core::Laboratory::Sample.new(:name => "sample_#{i}")
      save_with_uuid(sample => sample_uuids[i])
    end
  }

  let(:create_labelled_tubes) {
    [0, 1, 2].each do |i|
      store.with_session do |session|
        tube = Lims::Core::Laboratory::Tube.new
        tube << Lims::Core::Laboratory::Aliquot.new(:sample => session[sample_uuids[i]],
                                                    :type => "NA+P",
                                                    :quantity => 1000)
        labellable = Lims::Core::Laboratory::Labellable.new(:name => tube_uuids[i], :type => "resource")
        labellable["barcode"] = Lims::Core::Laboratory::Labellable::Label.new(:type => "ean13-barcode", 
                                                                              :value => source_tube_barcodes[i])
        set_uuid(session, tube, tube_uuids[i])
        set_uuid(session, labellable, labellable_uuids[i])
      end
    end
  }

  # Create orders
  # First order with 2 tubes, Second order with 1 tube
  let(:create_orders) {
    [[tube_uuids[0], tube_uuids[1]], [tube_uuids[2]]].each_with_index do |source_tubes, index|
      store.with_session do |session|
        order = Lims::Core::Organization::Order.new(:creator => session[user_uuid],
                                                    :study => session[study_uuid],
                                                    :pipeline => "DNA+RNA manual extraction",
                                                    :cost_code => "cost code")
        order.add_source("tube_to_be_extracted_na+p", source_tubes)
        set_uuid(session, order, order_uuids[index])
      end
    end
  }

  let!(:setup) {
    order_config
    create_samples
    create_labelled_tubes
    create_orders
  }
end
