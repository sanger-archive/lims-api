require "integrations/requests/apiary/9_labellable_resource/spec_helper"
describe "add_multiply_labels_to_an_asset_with_an_existing_label" do
  include_context "use core context service"
  it "add_multiply_labels_to_an_asset_with_an_existing_label" do
  # **Add multiply labels to an asset with an existing label.**
  # 
  # * `labellable_uuid` unique identifier of an object the labellable related to
  # * `type` the type of the label. It can be 'sanger-barcode', '2d-barcode', 'ean13-barcode' etc...
  # * `value` the value of the barcode
  # * `position` the position of the barcode is an arbitray string (not a Symbol).
    tube = Lims::Core::Laboratory::Tube.new
    labellable = Lims::Core::Laboratory::Labellable.new(:name => "11111111-2222-3333-4444-000000000000",
                                                        :type => "resource")
    label = Lims::Core::Laboratory::Labellable::Label.new(:type => "sanger-barcode",
                                                          :value => "1234-ABC")
    labellable["front barcode"] = label
    
    save_with_uuid tube => [1,2,3,4,0], labellable => [1,2,3,4,5]

    header('Accept', 'application/json')
    header('Content-Type', 'application/json')

    response = post "/actions/create_label", "{ \"create_label\": {\n    \"labellable_uuid\": \"11111111-2222-3333-4444-555555555555\",\n    \"type\": \"2d-barcode\",\n    \"value\": \"2d-barcode-1234\",\n    \"position\": \"rear barcode\"\n}}\n" 
    response.status.should == 200
    response.body.should match_json "{ \"create_label\": {\n    \"actions\": {\n    },\n    \"user\": \"user\",\n    \"application\": \"application\",\n    \"result\": {\n        \"labellable\": {\n            \"actions\": {\n                \"read\": \"http://example.org/11111111-2222-3333-4444-555555555555\",\n                \"update\": \"http://example.org/11111111-2222-3333-4444-555555555555\",\n                \"delete\": \"http://example.org/11111111-2222-3333-4444-555555555555\",\n                \"create\": \"http://example.org/11111111-2222-3333-4444-555555555555\"\n            },\n            \"uuid\": \"11111111-2222-3333-4444-555555555555\",\n            \"name\": \"11111111-2222-3333-4444-000000000000\",\n            \"type\": \"resource\",\n            \"labels\": {\n                \"front barcode\": {\n                    \"value\": \"1234-ABC\",\n                    \"type\": \"sanger-barcode\"\n                },\n                \"rear barcode\": {\n                    \"value\": \"2d-barcode-1234\",\n                    \"type\": \"2d-barcode\"\n                }\n            }\n        }\n    },\n    \"labellable_uuid\": \"11111111-2222-3333-4444-555555555555\",\n    \"type\": \"2d-barcode\",\n    \"value\": \"2d-barcode-1234\",\n    \"position\": \"rear barcode\"\n}}\n"

  end
end
