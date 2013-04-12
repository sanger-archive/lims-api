require "integrations/requests/apiary/8_order_resource/spec_helper"
describe "list_actions_for_order_resource" do
  include_context "use core context service"
  it "list_actions_for_order_resource" do
  # **List actions for order resource.**
  # 
  # * `create` creates a new order via HTTP POST request
  # * `read` returns the list of actions for an order resource via HTTP GET request
  # * `first` lists the first order resources in a page browsing system
  # * `last` lists the last order resources in a page browsing system

    header('Accept', 'application/json')
    header('Content-Type', 'application/json')

    response = get "/orders"
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "orders": {
        "actions": {
            "create": "http://example.org/orders",
            "read": "http://example.org/orders",
            "first": "http://example.org/orders/page=1",
            "last": "http://example.org/orders/page=-1"
        }
    }
}
    EOD

  end
end
