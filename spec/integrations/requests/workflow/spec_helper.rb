require "integrations/requests/spec_helper"
# This file will be required by
# all file in this directory and subdirectory

shared_context "setup_s2_environment_for_dna_rna_manual_extraction" do
  # Needed for the order creation
  # - a valid study uuid
  # - a valid user uuid
  # Add a user and a study in the core
  let(:order_config) { 
    store.with_session do |session|
      user = Lims::Core::Organization::User.new
      session << user
      user_uuid = session.uuid_for!(user)

      study = Lims::Core::Organization::Study.new
      session << study
      study_uuid = session.uuid_for!(study)

      lambda { {:user_id => session.id_for(user), :study_id => session.id_for(study)} }
    end.call
  }

  # Setup the orders for dna_rna manual extraction pipeline
  # 2 tubes in 1 order
  # 1 tube in 1 order

  # Create the tubes for dna+rna manual extraction orders
  # Barcode each tube
  let(:source_tube_barcodes) { ["1220017279667", "1220017279668", "1220017279669"] }
  let(:tube_manual_uuids) {
    [0, 1, 2].map! do |i|
      store.with_session do |session|
        tube = Lims::Core::Laboratory::Tube.new
        sample = Lims::Core::Laboratory::Sample.new(:name => "sample_#{i}") 
        tube << Lims::Core::Laboratory::Aliquot.new(:sample => sample,
                                                    :type => "NA+P",
                                                    :quantity => 1000)
        session << tube
        tube_uuid = session.uuid_for!(tube)

        labellable = Lims::Core::Laboratory::Labellable.new(:name => tube_uuid, :type => "resource")
        labellable["barcode"] = Lims::Core::Laboratory::Labellable::Label.new(:type => "ean13-barcode", 
                                                                              :value => source_tube_barcodes[i])
        session << labellable
        session.uuid_for!(labellable)

        lambda { tube_uuid }
      end.call
    end
  }

  # Create orders
  # First order with 2 tubes, Second order with 1 tube
  let(:create_order) {
    [[tube_manual_uuids[0], tube_manual_uuids[1]], [tube_manual_uuids[2]]].each do |source_tubes|
      store.with_session do |session|
        order = Lims::Core::Organization::Order.new(:creator => session.user[order_config[:user_id]],
                                                    :study => session.study[order_config[:study_id]],
                                                    :pipeline => "DNA+RNA manual extraction",
                                                    :cost_code => "cost code")
        order.add_source("tube_to_be_extracted_na+p", source_tubes)
        session << order
        session.uuid_for!(order)
      end
    end
  }
end
