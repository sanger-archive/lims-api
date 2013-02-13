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
