require "integrations/requests/examples/spec_helper"
#some bits of code
describe "Global example" do
  include_context "use core context service"
  it "example 1" do


    response = get "/example", nil 
    response.status.should == 200
    response.body.should match_json "{}"

  end
  it "example 2" do


    response = post "/exampl2", nil 
    response.status.should == 404

  end
end
