require "integrations/requests/apiary/10_batch_resource/spec_helper"
describe "create_a_new_batch" do
  include_context "use core context service"
  it "create_a_new_batch" do
  # **Create a new batch**
  # 
  # * `process` the process that the batch is going through

    header('Accept', 'application/json')
    header('Content-Type', 'application/json')

    response = post "/batches", "{ \"batch\": {\"process\": \"manual extraction\"} }\n" 
    response.status.should == 200
    response.body.should match_json "{\n   \"batch\":{\n      \"actions\":{\n         \"read\":\"http://example.org/11111111-2222-3333-4444-555555555555\",\n         \"create\":\"http://example.org/11111111-2222-3333-4444-555555555555\",\n         \"update\":\"http://example.org/11111111-2222-3333-4444-555555555555\",\n         \"delete\":\"http://example.org/11111111-2222-3333-4444-555555555555\"\n      },\n      \"uuid\":\"11111111-2222-3333-4444-555555555555\",\n      \"process\":\"manual extraction\"\n   }\n}\n"

  end
end
