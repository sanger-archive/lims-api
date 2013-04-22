require "integrations/requests/apiary/12_search/spec_helper"
describe "search_for_a_labellable", :search => true do
  include_context "use core context service"
  it "search_for_a_labellable" do


  # **Search for a labellable**
  # 
  # * `description` describe the search
  # * `model` labellable model 
  # * `criteria` set parameters for the search. Here, it can be a combination of the following attributes:
  #     * `position`
  #     * `type`
  #     * `value`
  # 
  # Searching for a labellable is useful to get a resource without knowing its model. 
  # In fact, in a normal search, the model attribute needs to be set. In the case the model of the
  # searched resource isn't known in advance, we can search its corresponding labellable,
  # then get the resource (the uuid of the resource appears under the name attribute in the labellable JSON).
  # 
  # To actually get the search results, you need to access the first page of result 
  # thanks to the `first` action in the JSON response.
    tube = Lims::Core::Laboratory::Tube.new
    labellable = Lims::Core::Labels::Labellable.new({
      :name => '11111111-2222-3333-4444-666666666666',
      :type => 'resource',
      :content => {'barcode' => Lims::Core::Labels::SangerBarcode.new({:value => 'ABC123456'})}
    })
    
    save_with_uuid tube => [1,2,3,4,6], labellable => [1,2,3,4,7]

    header('Accept', 'application/json')
    header('Content-Type', 'application/json')

    response = post "/searches", <<-EOD
    {
    "search": {
        "description": "search for a labellable",
        "model": "labellable",
        "criteria": {
            "label": {
                "value": "ABC123456"
            }
        }
    }
}
    EOD
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "search": {
        "actions": {
            "read": "http://example.org/11111111-2222-3333-4444-555555555555",
            "first": "http://example.org/11111111-2222-3333-4444-555555555555/page=1",
            "last": "http://example.org/11111111-2222-3333-4444-555555555555/page=-1"
        },
        "uuid": "11111111-2222-3333-4444-555555555555"
    }
}
    EOD

  # Get the search result

    header('Accept', 'application/json')
    header('Content-Type', 'application/json')

    response = get "/11111111-2222-3333-4444-555555555555/page=1"
    response.status.should == 200
    response.body.should match_json <<-EOD
    {
    "actions": {
        "read": "http://example.org/labellables/page=1",
        "first": "http://example.org/labellables/page=1",
        "last": "http://example.org/labellables/page=-1"
    },
    "size": 1,
    "labellables": [
        {
            "actions": {
                "read": "http://example.org/11111111-2222-3333-4444-777777777777",
                "create": "http://example.org/11111111-2222-3333-4444-777777777777",
                "update": "http://example.org/11111111-2222-3333-4444-777777777777",
                "delete": "http://example.org/11111111-2222-3333-4444-777777777777"
            },
            "uuid": "11111111-2222-3333-4444-777777777777",
            "name": "11111111-2222-3333-4444-666666666666",
            "type": "resource",
            "labels": {
                "barcode": {
                    "value": "ABC123456",
                    "type": "sanger-barcode"
                }
            }
        }
    ]
}
    EOD

  end
end
