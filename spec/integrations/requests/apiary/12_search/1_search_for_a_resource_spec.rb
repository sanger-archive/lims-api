require "integrations/requests/apiary/12_search/spec_helper"
describe "search_for_a_resource", :search => true do
  include_context "use core context service"
  it "search_for_a_resource" do
  # **Search for a resource**
  # 
  # * `description` describe the search
  # * `model` searched model
  # * `criteria` set parameters for the search
  # 
  # The search below returns plates with ids 1 and 2.
  # You can search for a tube the same way as below if you know its id.
  # 
  # To actually get the search results, you need to access the first page of result 
  # thanks to the `first` action in the JSON response.

    header('Accept', 'application/json')
    header('Content-Type', 'application/json')

    response = post "/searches", <<-EOD
    {
    "search": {
        "description": "search for a plate by ids",
        "model": "plate",
        "criteria": {
            "id": [
                1,
                2
            ]
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
