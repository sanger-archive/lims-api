require "integrations/requests/apiary/12_search/spec_helper"
describe "search_for_a_resource_by_label" do
include_context "use core context service"
  # **Search for a resource by label**
  # 
  # * `description` describe the search
  # * `model` searched model
  # * `criteria` set parameters for the search. Here, it can be a combination of the following attributes:
  #     * `position`
  #     * `type`
  #     * `value`
  # 
  # The search below looks for a tube by its label which is a `sanger-barcode` with the position 
  # `front barcode` and the value `ABC123456`.
  # 
  # To actually get the search results, you need to access the first page of result 
  # thanks to the `first` action in the JSON response.
  it "search_for_a_resource_by_label" do

    header('Accept', 'application/json')
    header('Content-Type', 'application/json')

    response = post "/searches", "{ \"search\": {\n    \"description\": \"search for a tube by label\",\n    \"model\": \"tube\",\n    \"criteria\": {\n        \"label\": {\n            \"position\": \"front barcode\",\n            \"type\": \"sanger-barcode\",\n            \"value\": \"ABC123456\"\n        }\n    }\n}}\n" 
    response.status.should == 200
    response.body.should match_json "{\n    \"search\": {\n        \"actions\": {\n            \"read\": \"http://example.org/11111111-2222-3333-4444-555555555555\",\n            \"first\": \"http://example.org/11111111-2222-3333-4444-555555555555/page=1\",\n            \"last\": \"http://example.org/11111111-2222-3333-4444-555555555555/page=-1\"\n        },\n        \"uuid\": \"11111111-2222-3333-4444-555555555555\"\n    }\n}\n"
  end
end
