require 'lims-api/context'
shared_context "mock context" do
  let!(:server_context) {
    #Context.new(store, lambda { |url| "/#{url}"  }).tap do |context|
    mock(:context).tap do |context|
      context.stub(:url_for)  { |url| "/#{url}"  }
      context.stub(:recursively_lookup_uuid) { |a| a }
      #context.stub(:last_session) { mock(:last_session) }
    end
  }
end

shared_context "with filled aliquots" do
  let(:aliquot_array) {
    path = "http://example.org/#{sample_uuid}"
      [ { "sample"=> {"actions" => { "read" => path,
        "update" => path,
        "delete" => path,
        "create" => path }},
        "type" => aliquot_type
        } ]
  }
end

shared_context "resource with labels for the expected JSON" do
  let(:label_position_front) { "front_label" }
  let(:front_label_type) { "sanger-barcode" }
  let(:front_label_value) { "ABCD-1234" }
  let(:labels_hash) {
    { label_position_front => { "type" => front_label_type,
                                "value" => front_label_value}
    }
  }
end
