require "integrations/requests/apiary/3_tube_resource/spec_helper"
describe "create_an_new_empty_tube", :tube => true do
  include_context "use core context service"
  it "create_an_new_empty_tube" do
  # **Create an new empty tube.**

    header('Accept', 'application/json')
    header('Content-Type', 'application/json')

    response = post "/tubes", <<-EOD
    {
    "tube": {
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "tube": {
        "actions": {
            "read": "http://example.org/11111111-2222-3333-4444-555555555555",
            "create": "http://example.org/11111111-2222-3333-4444-555555555555",
            "update": "http://example.org/11111111-2222-3333-4444-555555555555",
            "delete": "http://example.org/11111111-2222-3333-4444-555555555555"
        },
        "uuid": "11111111-2222-3333-4444-555555555555",
        "type": null,
        "max_volume": null,
        "aliquots": [

        ]
    }
}
    EOD

  end
end
