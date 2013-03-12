require "integrations/requests/apiary/5_spin_column_resource/spec_helper"
describe "create_a_new_empty_spin_column" do
  include_context "use core context service"
  it "create_a_new_empty_spin_column" do
  # **Create a new empty spin column.**

    header('Accept', 'application/json')
    header('Content-Type', 'application/json')

    response = post "/spin_columns", "{ \"spin_column\": {} }\n" 
    response.status.should == 200
    response.body.should match_json "{ \"spin_column\": {\n    \"actions\": {\n        \"read\": \"http://example.org/11111111-2222-3333-4444-555555555555\",\n        \"create\": \"http://example.org/11111111-2222-3333-4444-555555555555\",\n        \"update\": \"http://example.org/11111111-2222-3333-4444-555555555555\",\n        \"delete\": \"http://example.org/11111111-2222-3333-4444-555555555555\"\n    },\n    \"uuid\": \"11111111-2222-3333-4444-555555555555\",\n    \"aliquots\": []\n}}\n"

  end
end
