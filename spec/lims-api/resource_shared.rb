require 'lims-api/context'

def create_element_hash
  {}.tap do |h|
    (1..number_of_rows).each do |r|
      (1..number_of_columns).each do |c|
        h["#{(?A.ord+r-1).chr}#{c}"]=[]
      end
    end
  end
end

shared_context "mock context" do
  let!(:server_context) {
    #Context.new(store, lambda { |url| "/#{url}"  }, '').tap do |context|
    mock(:context).tap do |context|
      context.stub(:url_for)  { |url| "/#{url}"  }
      context.stub(:recursively_lookup_uuid) { |a| a }
      context.stub(:last_session) { |s| s }
    end
  }
end
