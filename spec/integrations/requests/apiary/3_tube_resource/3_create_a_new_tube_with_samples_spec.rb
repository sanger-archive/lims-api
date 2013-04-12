require "integrations/requests/apiary/3_tube_resource/spec_helper"
describe "create_a_new_tube_with_samples" do
  include_context "use core context service"
  it "create_a_new_tube_with_samples" do
  # **Create a new tube with samples.** It takes in parameters an array of aliquots, each aliquot is 
  # identified with the following attributes:
  # 
  # * `type` the actual type of the tube
  # * `max_volume` the max volume a tube can hold
  # * `sample_uuid` uuid of a sample
  # * `type` aliquot type
  # * `aliquot_quantity` volume (ul) if liquid, mass (mg) if solid
    save_with_uuid Lims::Core::Laboratory::Sample.new(:name => 'sample 1') => [1,2,3,4,6]

    header('Accept', 'application/json')
    header('Content-Type', 'application/json')

    response = post "/tubes", <<-EOD
    {
    "tube": {
        "type": "Eppendorf",
        "max_volume": 2,
        "aliquots": [
            {
                "sample_uuid": "11111111-2222-3333-4444-666666666666",
                "type": "NA",
                "quantity": 5
            }
        ]
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
        "type": "Eppendorf",
        "max_volume": 2,
        "aliquots": [
            {
                "sample": {
                    "actions": {
                        "read": "http://example.org/11111111-2222-3333-4444-666666666666",
                        "create": "http://example.org/11111111-2222-3333-4444-666666666666",
                        "update": "http://example.org/11111111-2222-3333-4444-666666666666",
                        "delete": "http://example.org/11111111-2222-3333-4444-666666666666"
                    },
                    "uuid": "11111111-2222-3333-4444-666666666666",
                    "name": "sample 1"
                },
                "quantity": 5,
                "type": "NA",
                "unit": "mole"
            }
        ]
    }
}
    EOD

  end
end
