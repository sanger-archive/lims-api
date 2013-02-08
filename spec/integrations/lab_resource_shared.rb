shared_examples_for "creating a resource" do |path=nil|
  include_context "use generated uuid"
  it "creates a new resource" do
    post(path || "/#{model}", parameters.to_json).body.should match_json(expected_json)
  end
  it "reads the created resource" do
    post(path || "/#{model}", parameters.to_json)
    get("/#{uuid}").body.should match_json(expected_json)
  end
end

shared_examples_for "updating a resource" do
  it "updates a resource" do
    put(path, parameters.to_json).body.should match_json(expected_json)
  end
  it "reads the updated resource" do
    put(path, parameters.to_json)
    get(path).body.should match_json(expected_json)
  end
end

shared_examples_for "creating a resource with a label on it" do
  include_context "use generated uuid"
  it "creates the resource with a label" do
    post("/#{model}", parameters.to_json)
    post("/#{label_model}", label_parameters.to_json)
    get("/#{uuid}").body.should match_json(expected_json)
  end
end

shared_context "with saved sample" do
  let!(:sample_name) { "sample 1" }
  let!(:sample) { Lims::Core::Laboratory::Sample.new(sample_name) }
  let!(:sample_uuid) {
    # We normally don't need it, and can use a generated one
    # but we do that here to override the stub use to set the container's uuid.
    '11111111-2222-3333-4444-888888888888'.tap do |uuid|
      store.with_session do |session|
        session << sample
        ur = session.new_uuid_resource_for(sample)
        ur.send(:uuid=, uuid)
      end
    end
  }
end

shared_context "with labels" do
  let(:label_model) { "labellables" }
  let!(:asset_type) { "resource" }
  let!(:resource_uuid) { uuid }
  let!(:labellable) {
    labellable = Lims::Core::Laboratory::Labellable.new(:name => resource_uuid,
                                                         :type => asset_type)
  }
  let!(:labellable_uuid) {
    '11111111-9999-3333-4444-888888888888'.tap do |labellable_uuid|
      store.with_session do |session|
        labellable[label_position_front] =
                Lims::Core::Laboratory::SangerBarcode.new({ :value => front_label_value })
        session << labellable
        ur = session.new_uuid_resource_for(labellable)
        ur.send(:uuid=, labellable_uuid)
      end
    end
  }

  let(:actions_hash) {
    path = "http://example.org/#{labellable_uuid}"
      {"actions" => {"read" => path,
                     "update" => path,
                     "delete" => path,
                     "create" => path}
      }
  }
  let(:labellable_uuid_hash) {
    { "uuid" => labellable_uuid }
  }
end

shared_context "with sample in location" do
  include_context "with saved sample"
  let(:aliquot_type) { 'sample' }
  let!(:uuid) {
    "11111111-2222-3333-4444-555555555555".tap do |uuid|
      #save the flowcell
      sample_uuid
      store.with_session do |session|
        subject[sample_location] << Lims::Core::Laboratory::Aliquot.new(:sample => session[sample_uuid], 
                                                                        :type => aliquot_type,
                                                                        :quantity => 10)
        session << subject
        set_uuid(session, subject, uuid)
      end
    end
  }
end

shared_context "has dimensions" do |number_of_rows, number_of_columns|
  let(:number_of_rows) { number_of_rows }
  let(:number_of_columns) { number_of_columns }
  let(:dimensions) { {:number_of_rows => number_of_rows, :number_of_columns => number_of_columns} }
end

shared_context "has standard dimensions" do
  include_context("has dimensions", 8, 12)
end

shared_context "expected labellables JSON" do
  let(:expected_json) {
    path = "http://example.org/#{uuid}"
    { "labellable" => { "actions" => {"read" => path,
                                      "update" => path,
                                      "delete" => path,
                                      "create" => path},
                        "uuid" => uuid,
                        "name" => name,
                        "type" => asset_type,
                        "labels" => labels_hash
                      }
    }
  }
end

shared_context "create a labellable" do
  let!(:labellable) {
    store.with_session do |session|
      session << labellable=Laboratory::Labellable.new(:name => name, :type => :asset_type)
      labellable
    end
  }
end

shared_context "setup required parameters for labellable" do
  let(:name) { '11111111-2222-3333-1111-000000000000' } # uuid of an asset (e.g.: plate)
  let(:asset_type) { 'resource'} # type of the asset the labellables belongs to
  let(:required_parameters) { { :name => name, :type => asset_type} }
end
