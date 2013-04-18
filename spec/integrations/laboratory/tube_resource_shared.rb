shared_context "for empty tube-like asset" do
  let(:aliquot_array) { [] }
  let(:viewed_aliquot_array) { aliquot_array }
  let(:parameters) { { asset => { } }}
end

shared_context "for tube-like asset with samples" do
  let(:sample) { Lims::Core::Laboratory::Sample.new("sample 1") }
  include_context "with saved sample"
  let(:aliquot_type) { "sample" }
  let(:aliquot_quantity) { 10 }
  let(:unit_type) { "mole" }
  let(:aliquots) { [ { "sample_uuid" => sample_uuid, :type => aliquot_type, :quantity => aliquot_quantity } ] }
  let(:parameters) { { asset => {:aliquots => aliquots}} }
end

shared_context "for tube with samples" do
  include_context "for tube-like asset with samples"
  let(:tube_type) { "Eppendorf" }
  let(:tube_max_volume) { 2 }
  let(:parameters) { {asset => {:aliquots => aliquots, :type => tube_type, :max_volume => tube_max_volume}} }
end

shared_context "for tube with samples and labels" do
  include_context "for tube with samples"
  let(:label_parameters) {{ :labellables => labellable }}
end

shared_context "for spin column with samples and labels" do
  include_context "for tube-like asset with samples"
  let(:label_parameters) {{ :labellables => labellable }}
end

shared_context "for creating a tube with aliquot and solvent in it" do
  let(:source_tube1_uuid) { '22222222-3333-4444-1111-000000000000'.tap do |uuid|
    store.with_session do |session|
      quantity = 100
      tube = Lims::Core::Laboratory::Tube.new
#            (1..5).each do |i|
        sample = Lims::Core::Laboratory::Sample.new(:name => "sample 1")
        aliquot = Lims::Core::Laboratory::Aliquot.new(:sample => sample, :quantity => 100, :type => aliquot_type)
        tube << aliquot
#            end
      tube << Lims::Core::Laboratory::Aliquot.new(:type => Lims::Core::Laboratory::Aliquot::Solvent, :quantity => volume)

      session << tube
      set_uuid(session, tube, uuid)
    end
  end
  }
end

shared_context "for creating an empty tube without aliquots" do
  let(:target_tube2_uuid) { '22222222-3333-4444-1111-000000000001'.tap do |uuid|
      store.with_session do |session|
        tube = Lims::Core::Laboratory::Tube.new

        session << tube
        set_uuid(session, tube, uuid)
      end
    end
  }
end

shared_context "for creating an empty spin column without aliquots" do
  let(:target_spin_column_uuid) { '22222222-3333-4444-1111-000000000002'.tap do |uuid|
      store.with_session do |session|
        spin_column = Lims::Core::Laboratory::SpinColumn.new

        session << spin_column
        set_uuid(session, spin_column, uuid)
      end
    end
  }
end
