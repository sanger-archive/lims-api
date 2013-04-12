require "integrations/requests/apiary/10_batch_resource/spec_helper"
describe "update_a_batch" do
  include_context "use core context service"
  it "update_a_batch" do
  # **Update a batch**
  # 
  # * `process` the process that the batch is going through
  # * `kit`
    batch = Lims::Core::Organization::Batch.new
    save_with_uuid batch => [1,2,3,4,5]

    header('Accept', 'application/json')
    header('Content-Type', 'application/json')

    response = put "/11111111-2222-3333-4444-555555555555", <<-EOD
    {
    "process": "manual extraction",
    "kit": "AAABBBCCC"
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "batch": {
        "actions": {
            "read": "http://example.org/11111111-2222-3333-4444-555555555555",
            "create": "http://example.org/11111111-2222-3333-4444-555555555555",
            "update": "http://example.org/11111111-2222-3333-4444-555555555555",
            "delete": "http://example.org/11111111-2222-3333-4444-555555555555"
        },
        "uuid": "11111111-2222-3333-4444-555555555555",
        "process": "manual extraction",
        "kit": "AAABBBCCC"
    }
}
    EOD

  end
end
