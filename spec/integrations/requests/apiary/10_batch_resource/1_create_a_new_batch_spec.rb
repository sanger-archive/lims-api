require "integrations/requests/apiary/10_batch_resource/spec_helper"
describe "create_a_new_batch" do
  include_context "use core context service"
  it "create_a_new_batch" do
  # **Create a new batch**
  # 
  # * `process` the process that the batch is going through

    header('Accept', 'application/json')
    header('Content-Type', 'application/json')

    response = post "/batches", <<-EOD
    {
    "batch": {
        "process": "manual extraction",
        "kit": "AAABBBCCC"
    }
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
