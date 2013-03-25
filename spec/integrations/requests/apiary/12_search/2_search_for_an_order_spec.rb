require "integrations/requests/apiary/12_search/spec_helper"
describe "search_for_an_order" do
  include_context "use core context service"
  it "search_for_an_order" do
  # **Search for an order**
  # 
  # * `description` describe the search
  # * `model` searched model
  # * `criteria` set parameters for the search. Here, it can be a combination of the following attributes:
  #     * `pipeline` 
  #     * `items` which itself can contain the parameters `uuid`, `status`, `role` and `batch_uuid`
  #     * `status`
  #     * `cost_code`
  # 
  # The search below looks for an order for the `pipeline 1` which has a status `in_progress`. On top of
  # that, the search looks for an order which contains an item which has the uuid 
  # `11111111-2222-3333-4444-555555555555` in the status `done` with the role `role A` and assigned to the
  # batch `11111111-2222-3333-4444-666666666666`.
  # 
  # You can specify arrays in the criteria as well. For example, if you need to get an order which 
  # contains items with role `role A` and `role B`, you could have the following criteria:
  # `"criteria": { "item": { "role": ["role A", "role B"] } }`
  # 
  # To actually get the search results, you need to access the first page of result 
  # thanks to the `first` action in the JSON response.

    header('Accept', 'application/json')
    header('Content-Type', 'application/json')

    response = post "/searches", "{ \"search\": {\n    \"description\": \"search for an order\",\n    \"model\": \"plate\",\n    \"criteria\": {\n        \"pipeline\": \"pipeline 1\",\n        \"status\": \"in_progress\",\n        \"item\": {\n            \"uuid\": \"11111111-2222-3333-4444-555555555555\",\n            \"status\": \"done\",\n            \"role\": \"role A\",\n            \"batch_uuid\": \"11111111-2222-3333-4444-666666666666\"\n        }\n    }\n}}\n" 
    response.status.should == 200
    response.body.should match_json "{\n    \"search\": {\n        \"actions\": {\n            \"read\": \"http://example.org/11111111-2222-3333-4444-555555555555\",\n            \"first\": \"http://example.org/11111111-2222-3333-4444-555555555555/page=1\",\n            \"last\": \"http://example.org/11111111-2222-3333-4444-555555555555/page=-1\"\n        },\n        \"uuid\": \"11111111-2222-3333-4444-555555555555\"\n    }\n}\n"

  end
end
