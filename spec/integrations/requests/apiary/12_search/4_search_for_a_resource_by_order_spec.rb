require "integrations/requests/apiary/12_search/spec_helper"
describe "search_for_a_resource_by_order", :search => true do
  include_context "use core context service"
  it "search_for_a_resource_by_order" do
  # **Search for a resource by order**
  # 
  # * `description` describe the search
  # * `model` search for resource instances of model
  # * `criteria` set parameters for the search. Here, it can be a combination of the following attributes:
  #     * `pipeline` 
  #     * `items` which itself can contain the parameters `status` and `role`
  #     * `status`
  #     * `cost_code`
  # 
  # The search below looks for a tube used in a order for the pipeline `pipeline 1` which has the status `in_progress`.
  # On top of that, the tube used in that order should have a role `role A` and a `pending` status.
  # 
  # To actually get the search results, you need to access the first page of result 
  # thanks to the `first` action in the JSON response.

    header('Accept', 'application/json')
    header('Content-Type', 'application/json')

    response = post "/searches", <<-EOD
    {
    "search": {
        "description": "search for a tube by order",
        "model": "tube",
        "criteria": {
            "order": {
                "pipeline": "pipeline 1",
                "status": "in_progress",
                "item": {
                    "role": "role A",
                    "status": "pending"
                }
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
