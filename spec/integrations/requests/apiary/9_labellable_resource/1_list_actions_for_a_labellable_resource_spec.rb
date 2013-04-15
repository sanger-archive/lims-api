require "integrations/requests/apiary/9_labellable_resource/spec_helper"
describe "list_actions_for_a_labellable_resource", :labellable => true do
  include_context "use core context service"
  it "list_actions_for_a_labellable_resource" do
  # **List actions for a labellable resource.**
  # 
  # * `create` creates a new labellable via HTTP POST request
  # * `read` currently returns the list of actions for a labellable resource via HTTP GET request
  # * `first` lists the first labellable resources in a page browsing system
  # * `last` lists the last labellable resources in a page browsing system

    header('Accept', 'application/json')
    header('Content-Type', 'application/json')

    response = get "/labellables"
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "labellables": {
        "actions": {
            "create": "http://example.org/labellables",
            "read": "http://example.org/labellables",
            "first": "http://example.org/labellables/page=1",
            "last": "http://example.org/labellables/page=-1"
        }
    }
}
    EOD

  end
end
