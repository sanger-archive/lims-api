#shared contexts for integrations
shared_context 'use core context service' do
 let(:db) { connect_db(:test) }
  let(:store) { Lims::Core::Persistence::Sequel::Store.new(db) }
  let(:context_service) { Lims::Api::ContextService.new(store) }

  before(:each) do
    app.set(:context_service, context_service)
    db[:uuid_resources].delete
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

