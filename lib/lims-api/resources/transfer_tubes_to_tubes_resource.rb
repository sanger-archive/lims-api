require 'lims-api/core_action_resource'
require 'lims-api/resources/container_to_uuid'

module Lims::Api
  module Resources
    class TransferTubesToTubesResource < CoreActionResource

      include ContainerToUuid

    end
  end
end
