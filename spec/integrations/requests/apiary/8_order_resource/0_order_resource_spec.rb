require "integrations/requests/apiary/8_order_resource/spec_helper"
describe "order_resource", :order => true do
  include_context "use core context service"
  it "order_resource" do
  # An order stores all the information needed by a pipeline to achieve works. In particular, an order has a list of 
  # items which are used and a status. Items map a role to a resource (like a plate or a tube). A role informs how 
  # an item participates in the order. A status represents the progress of the order from an end-user point
  # of view. A status is meant to be used in order related application, not by the pipeline. Typically, when the
  # pipeline interacts with the order, its status should be `in_progress`. Here is the different status for an order: 
  # 
  # * `draft` this is the initial state on order creation
  # * `pending` after a `build` event. The order has been validated by the user and is ready to be used
  # * `in_progress` after a `start` event. The order has been started, it belongs to a pipeline and works are in progress
  # * `completed` after a `complete` event. The order has been fulfilled with success. The order cannot be modified.
  # * `cancelled` after a `cancel` event. The order has been cancelled by the user. The order cannot be modified.
  # * `failed` after a `fail` event. The order cannot be completed for some reason. The order cannot be modified.
  # 
  # On top of that, each item in an order gets a status which represent its progress. It can be one of the following: 
  # 
  # * `pending` which is the initial state of an item or after a `reset` event.
  # * `in_progress` after a `start` event. Some work are on-going using the item.
  # * `done` after a `complete` event. The item is available to be used in a new pipeline step.
  # * `cancelled` after a `cancel` event. The item has been cancelled by the user.
  # * `failed` after a `fail` event. The item cannot be done for some reason.
  # 
  # --


  end
end
