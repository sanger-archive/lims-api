require 'lims-api/core_action_resource'
require 'lims-api/resources/container_to_uuid'

require 'lims-core/laboratory/tube'

module Lims::Api
  module Laboratory
    class Tube
      class TransferTubesToTubesResource < CoreActionResource

        include ContainerToUuid

      end
    end
  end
end
