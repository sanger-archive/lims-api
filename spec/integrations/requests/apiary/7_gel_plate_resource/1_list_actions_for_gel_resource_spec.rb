require "integrations/requests/apiary/7_gel_plate_resource/spec_helper"
describe "list_actions_for_gel_resource" do
  include_context "use core context service"
  it "list_actions_for_gel_resource" do
  # **List actions for gel resource.**
  # 
  # * `create` creates a new gel plate via HTTP POST request
  # * `read` returns the list of actions for a gel plate resource via HTTP GET request
  # * `first` lists the first gel plates resources in a page browsing system
  # * `last` lists the last gel plates resources in a page browsing system

    header('Accept', 'application/json')
    header('Content-Type', 'application/json')

    response = get "/gels"
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "gels": {
        "actions": {
            "create": "http://example.org/gels",
            "read": "http://example.org/gels",
            "first": "http://example.org/gels/page=1",
            "last": "http://example.org/gels/page=-1"
        }
    }
}
    EOD

  end
end
