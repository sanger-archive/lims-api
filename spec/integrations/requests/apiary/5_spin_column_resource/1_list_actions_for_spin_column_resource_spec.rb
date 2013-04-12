require "integrations/requests/apiary/5_spin_column_resource/spec_helper"
describe "list_actions_for_spin_column_resource" do
  include_context "use core context service"
  it "list_actions_for_spin_column_resource" do
  # **List actions for spin column resource.**
  # 
  # * `create` creates a new spin column via HTTP POST request
  # * `read` returns the list of actions for a spin column resource via HTTP GET request
  # * `first` lists the first spin columns resources in a page browsing system
  # * `last` lists the last spin columns resources in a page browsing system

    header('Accept', 'application/json')
    header('Content-Type', 'application/json')

    response = get "/spin_columns"
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "spin_columns": {
        "actions": {
            "create": "http://example.org/spin_columns",
            "read": "http://example.org/spin_columns",
            "first": "http://example.org/spin_columns/page=1",
            "last": "http://example.org/spin_columns/page=-1"
        }
    }
}
    EOD

  end
end
