require "integrations/requests/apiary/4_tube_rack_resource/spec_helper"
describe "create_a_new_empty_tube_rack", :tube_rack => true do
  include_context "use core context service"
  it "create_a_new_empty_tube_rack" do
  # **Create a new empty tube rack.**
  # 
  # * `number_of_rows` number of rows in the rack
  # * `number_of_columns` number of columns in the rack
  # * `tubes` map tubes identified by their uuids to rack locations

    header('Accept', 'application/json')
    header('Content-Type', 'application/json')

    response = post "/tube_racks", <<-EOD
    {
    "tube_rack": {
        "number_of_rows": 8,
        "number_of_columns": 12,
        "tubes": {
        }
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "tube_rack": {
        "actions": {
            "create": "http://example.org/11111111-2222-3333-4444-555555555555",
            "read": "http://example.org/11111111-2222-3333-4444-555555555555",
            "update": "http://example.org/11111111-2222-3333-4444-555555555555",
            "delete": "http://example.org/11111111-2222-3333-4444-555555555555"
        },
        "uuid": "11111111-2222-3333-4444-555555555555",
        "number_of_rows": 8,
        "number_of_columns": 12,
        "tubes": {
        }
    }
}
    EOD

  end
end
