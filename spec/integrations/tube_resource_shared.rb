shared_context "for empty tube-like asset" do
  let(:aliquot_array) { [] }
  let(:viewed_aliquot_array) { aliquot_array }
  let(:parameters) { { asset => { } }}
end

shared_context "for tube-like asset with samples" do
  let(:sample) { Lims::Core::Laboratory::Sample.new("sample 1") }
  include_context "with saved sample"
  let(:aliquot_type) { "sample" }
  let(:unit_type) { "mole" }
  let(:aliquots) {{:aliquots => [ { "sample_uuid" => sample_uuid, :type => aliquot_type } ] }}
  let(:parameters) { { asset => aliquots} }
end

shared_context "for tube-like asset with samples and labels" do
  include_context "for tube-like asset with samples"

  let(:label_parameters) {
    { :labellables => labellable }
  }
end
