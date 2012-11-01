
shared_examples_for "creating a resource" do
  include_context "use generated uuid"
  it "creates a new plate" do
    post("/#{model}", parameters.to_json).body.should match_json(expected_json)
  end
  it "reads the created resource" do
    post("/#{model}", parameters.to_json)
    get("/#{uuid}").body.should match_json(expected_json)
  end
end

shared_context "with saved sample" do
  let(:sample_name) { "sample 1" }
  let(:sample) { Lims::Core::Laboratory::Sample.new(sample_name) }
  let(:sample_uuid) {
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

shared_context "with sample in location" do
  include_context "with saved sample"
  let!(:uuid) {
    "11111111-2222-3333-4444-555555555555".tap do |uuid|
      #save the flowcell
      sample_uuid
      store.with_session do |session|
        subject[sample_location] << Lims::Core::Laboratory::Aliquot.new(:sample => session[sample_uuid])
        session << subject
        set_uuid(session, subject, uuid)
      end
    end
  }
end

