#shared contexts for integrations
def connect_db(env)
  config = YAML.load_file(File.join('config','database.yml'))
  Sequel.connect(config[env.to_s])
end
shared_context 'use core context service' do |*tables|
 let(:db) { connect_db(:test) }
  let(:store) { Lims::Core::Persistence::Sequel::Store.new(db) }
  let(:context_service) { Lims::Api::ContextService.new(store) }

  before(:each) do
    app.set(:context_service, context_service)
    db[:uuid_resources].delete
    tables.each { |table| db[table].delete }
  end
end

shared_context 'JSON' do
  before(:each) {
    header('Accept', 'application/json')
    header('Content-Type', 'application/json')
  }
end

shared_context "use generated uuid" do 
  let! (:uuid) {
    '11111111-2222-3333-4444-555555555555'.tap do |uuid|
    Lims::Core::Uuids::UuidResource.stub(:generate_uuid).and_return(uuid)
    end
  }
end

shared_context "a valid core action" do |&extra|
  it "creates something" do
    response = post(url, parameters.to_json)
    response.status.should == 200
    response.body.should match_json(expected_json)
    extra.call(response) if extra
  end
end

shared_context "an invalid core action" do |expected_status, &extra|
  it "doesn't create anything" do
    response = post(url, parameters.to_json)
    response.status.should  == expected_status
    response.body.should match_json(expected_json) if expected_json
    extra.call(response) if extra
  end
end

shared_context "with saved sample" do
  let(:sample) { Lims::Core::Laboratory::Sample.new("sample 1") }
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
