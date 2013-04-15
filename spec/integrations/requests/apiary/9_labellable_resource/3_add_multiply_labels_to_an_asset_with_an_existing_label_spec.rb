require "integrations/requests/apiary/9_labellable_resource/spec_helper"
describe "add_multiply_labels_to_an_asset_with_an_existing_label", :labellable => true do
  include_context "use core context service"
  it "add_multiply_labels_to_an_asset_with_an_existing_label" do
  # **Add multiply labels to an asset with an existing label.**
  # 
  # * `labellable_uuid` unique identifier of an object the labellable related to
  # * `type` the type of the label. It can be 'sanger-barcode', '2d-barcode', 'ean13-barcode' etc...
  # * `value` the value of the barcode
  # * `position` the position of the barcode is an arbitray string (not a Symbol).
    tube = Lims::Core::Laboratory::Tube.new
    labellable = Lims::Core::Labels::Labellable.new(:name => "11111111-2222-3333-4444-000000000000",
                                                        :type => "resource")
    label = Lims::Core::Labels::Labellable::Label.new(:type => "sanger-barcode",
                                                          :value => "1234-ABC")
    labellable["front barcode"] = label
    
    save_with_uuid tube => [1,2,3,4,0], labellable => [1,2,3,4,5]

    header('Accept', 'application/json')
    header('Content-Type', 'application/json')

    response = post "/actions/create_label", <<-EOD
    {
    "create_label": {
        "labellable_uuid": "11111111-2222-3333-4444-555555555555",
        "type": "2d-barcode",
        "value": "2d-barcode-1234",
        "position": "rear barcode"
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "create_label": {
        "actions": {
        },
        "user": "user",
        "application": "application",
        "result": {
            "labellable": {
                "actions": {
                    "read": "http://example.org/11111111-2222-3333-4444-555555555555",
                    "update": "http://example.org/11111111-2222-3333-4444-555555555555",
                    "delete": "http://example.org/11111111-2222-3333-4444-555555555555",
                    "create": "http://example.org/11111111-2222-3333-4444-555555555555"
                },
                "uuid": "11111111-2222-3333-4444-555555555555",
                "name": "11111111-2222-3333-4444-000000000000",
                "type": "resource",
                "labels": {
                    "front barcode": {
                        "value": "1234-ABC",
                        "type": "sanger-barcode"
                    },
                    "rear barcode": {
                        "value": "2d-barcode-1234",
                        "type": "2d-barcode"
                    }
                }
            }
        },
        "labellable_uuid": "11111111-2222-3333-4444-555555555555",
        "type": "2d-barcode",
        "value": "2d-barcode-1234",
        "position": "rear barcode"
    }
}
    EOD

  end
end
