require "integrations/requests/apiary/9_labellable_resource/spec_helper"
describe "add_a_label_to_an_asset" do
  include_context "use core context service"
  it "add_a_label_to_an_asset" do
  # **Add a label to an asset.**
  # 
  # * `name` unique identifier of an asset (for example: uuid of a plate)
  # * `type` type of the object the labellable related (resource, equipment, user etc...)
  # * `labels` it is a hash which contains the information of the labels.
  # By labels we mean any readable information found on a physical object.
  # Label can eventually be identified by a position: an arbitray string (not a Symbol).
  # It has a value, which can be serial number, stick label with barcode etc.
  # It has a type, which can be sanger-barcode, 2d-barcode, ean13-barcode etc...
    save_with_uuid Lims::Core::Laboratory::Tube.new => [1,2,3,4,0]

    header('Accept', 'application/json')
    header('Content-Type', 'application/json')

    response = post "/labellables", <<-EOD
    {
    "labellable": {
        "name": "11111111-2222-3333-4444-000000000000",
        "type": "resource",
        "labels": {
            "front barcode": {
                "value": "1234-ABC",
                "type": "sanger-barcode"
            }
        }
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
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
            }
        }
    }
}
    EOD

  end
end
