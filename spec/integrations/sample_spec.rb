require 'spec_helper'

require 'lims-api/context_service'
require 'lims-core'
require 'lims-core/persistence/sequel'

require 'integrations/lab_resource_shared'
require 'integrations/spec_helper'

describe Lims::Core::Laboratory::Sample do
  include_context "use core context service", :samples
  include_context "JSON"
  let(:model) { "samples" }

  context "#read" do
    include_context "with saved sample"
    let (:expected_json) {
      path = "http://example.org/#{sample_uuid}"
      { "sample" => {"actions" => {"read" => path,
            "update" => path,
            "delete" => path,
            "create" => path}
          }
      }
    }
    it "reads the created sample" do
      get("/#{sample_uuid}").body.should match_json(expected_json)
    end
  end
end