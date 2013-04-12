require "integrations/requests/apiary/5_spin_column_resource/spec_helper"
describe "create_a_new_empty_spin_column" do
  include_context "use core context service"
  it "create_a_new_empty_spin_column" do
  # **Create a new empty spin column.**

    header('Accept', 'application/json')
    header('Content-Type', 'application/json')

    response = post "/spin_columns", <<-EOD
    {
    "spin_column": {
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "spin_column": {
        "actions": {
            "read": "http://example.org/11111111-2222-3333-4444-555555555555",
            "create": "http://example.org/11111111-2222-3333-4444-555555555555",
            "update": "http://example.org/11111111-2222-3333-4444-555555555555",
            "delete": "http://example.org/11111111-2222-3333-4444-555555555555"
        },
        "uuid": "11111111-2222-3333-4444-555555555555",
        "aliquots": [

        ]
    }
}
    EOD

  end
end
