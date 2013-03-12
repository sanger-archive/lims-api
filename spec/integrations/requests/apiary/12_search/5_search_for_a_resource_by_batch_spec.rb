require "integrations/requests/apiary/12_search/spec_helper"
describe "search_for_a_resource_by_batch" do
  include_context "use core context service"
  it "search_for_a_resource_by_batch" do
  # **Search for a resource by batch**
  # 
  # * `uuid` uuid ot a batch
  # 
  # The search below looks for a plate which is assigned to the batch `11111111-2222-3333-4444-666666666666` 
  # through an order item.
  # 
  # To actually get the search results, you need to access the first page of result 
  # thanks to the `first` action in the JSON response.

    header('Accept', 'application/json')
    header('Content-Type', 'application/json')

    response = post "/searches", "{ \"search\": {\n    \"description\": \"search for a plate by batch\",\n    \"model\": \"plate\",\n    \"criteria\": {\n        \"batch\": {\"uuid\": \"11111111-2222-3333-4444-666666666666\"}\n    }\n}}\n" 
    response.status.should == 200
    response.body.should match_json "{\n    \"search\": {\n        \"actions\": {\n            \"read\": \"http://example.org/11111111-2222-3333-4444-555555555555\",\n            \"first\": \"http://example.org/11111111-2222-3333-4444-555555555555/page=1\",\n            \"last\": \"http://example.org/11111111-2222-3333-4444-555555555555/page=-1\"\n        },\n        \"uuid\": \"11111111-2222-3333-4444-555555555555\"\n    }\n}\n"

  end
end
