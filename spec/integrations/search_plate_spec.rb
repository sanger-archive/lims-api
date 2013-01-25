require 'integrations/spec_helper'

require 'integrations/search_shared'
require 'integrations/lab_resource_shared'

shared_context "with 10 saved plates" do
  let(:plate_uuids) {
    (0..9).map { |i| "11111111-2222-3333-4444-88888888888#{i}" }
  }
  let!(:plate_ids) do
    store.with_session do |session|
      (1..10).map do |i|
        session << plate= Lims::Core::Laboratory::Plate.new(dimensions)
        set_uuid(session, plate, plate_uuids[i-1])
        lambda { session.id_for(plate) }
      end
    end.map { |l| l.call }
  end
end

shared_context "creating label(s) for plate(s)" do
  let(:asset_type) { "resource" }
  let(:label_position) { "front barcode" }
  let(:label_type) { "sanger-barcode" }
  let(:labels) {
    Hash.new.tap do |plate|
      (0..9).each do |plate_nr|
        plate[plate_nr] = plate_uuids[plate_nr]
      end
    end
  }

  let(:labellable_uuids) {
    (0..9).map { |i| "22221111-2222-3333-4444-88888888888#{i}" }
  }
  let!(:labellable_ids) {
    store.with_session do |session|
      (0..9).map do |i|
        session << labellable = Lims::Core::Laboratory::Labellable.new(:name => plate_uuids[i],
                                                           :type => asset_type)
        set_uuid(session, labellable, labellable_uuids[i-1])
        labellable[label_position] =
          Lims::Core::Laboratory::SangerBarcode.new({ :value => labels[i] })
      end
    end
  }
end

describe "Lims::Core::Persistence::Search"do
  include_context "use core context service", :wells, :aliquots, :plates, :samples, :searches, :labels, :labellables
  include_context "JSON"
  let(:model) { "searches" }

  context "#plate" do
    let(:searched_model) { "plate" }
    let(:description) { "description" }
    include_context "has standard dimensions"
    context "with 0 plate" do
      let(:criteria) { { :id => [1,2,5,7,8] } }
      it_behaves_like ("empty search")
    end

    context "with some plates" do
      include_context "with 10 saved plates"
      let(:criteria) { { :id => [1,2,5,7,8].map { |i| plate_ids[i] } }}
      it_behaves_like "search", 5
    end

    context "with some barcoded plates" do
      include_context "with 10 saved plates"
      include_context "creating label(s) for plate(s)"
      context "searching by their position" do
        let(:criteria) { { :label => { :position => label_position } } }
        it_behaves_like "search", 10
      end
      context "searching by their uuid (value) and type" do
        let(:criteria) { { :label => { :value => labels[0], :type => label_type } } }
        it_behaves_like "search", 1
      end
      context "searching by their uuid (value) and position" do
        let(:criteria) { { :label => { :value => labels[0], :position => label_position } } }
        it_behaves_like "search", 1
      end
    end
  end
end
