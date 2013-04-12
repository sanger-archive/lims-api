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

    response = post "/searches", <<-EOD
    {
    "search": {
        "description": "search for a plate by batch",
        "model": "plate",
        "criteria": {
            "batch": {
                "uuid": "11111111-2222-3333-4444-666666666666"
            }
        }
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "search": {
        "actions": {
            "read": "http://example.org/11111111-2222-3333-4444-555555555555",
            "first": "http://example.org/11111111-2222-3333-4444-555555555555/page=1",
            "last": "http://example.org/11111111-2222-3333-4444-555555555555/page=-1"
        },
        "uuid": "11111111-2222-3333-4444-555555555555"
    }
}
    EOD

  end
end
