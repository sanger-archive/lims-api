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
        "create" => path }}} ]
  }
end
