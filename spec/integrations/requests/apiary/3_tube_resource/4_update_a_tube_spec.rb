require "integrations/requests/apiary/3_tube_resource/spec_helper"
describe "update_a_tube" do
  include_context "use core context service"
  it "update_a_tube" do
  # **Update a tube.** All the aliquots in the tube will be updated with 
  # `aliquot_type` and `aliquot_quantity`.
  # 
  # * `type` the actual type of the tube
  # * `max_volume` the max volume a tube can hold
  # * `aliquot_type`
  # * `aliquot_quantity` volume (ul) if liquid, mass (mg) if solid
    sample = Lims::Core::Laboratory::Sample.new(:name => 'sample 1')
    tube = Lims::Core::Laboratory::Tube.new << Lims::Core::Laboratory::Aliquot.new(:quantity => 10, :type => "DNA", :sample => sample)
    
    save_with_uuid sample => [1,2,3,4,6], tube => [1,2,3,4,5]

    header('Accept', 'application/json')
    header('Content-Type', 'application/json')

    response = put "/11111111-2222-3333-4444-555555555555", <<-EOD
    {
    "aliquot_type": "DNA",
    "aliquot_quantity": 10,
    "type": "Eppendorf",
    "max_volume": 2
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
                "quantity": 10,
                "type": "DNA",
                "unit": "mole"
            }
        ]
    }
}
    EOD

  end
end
