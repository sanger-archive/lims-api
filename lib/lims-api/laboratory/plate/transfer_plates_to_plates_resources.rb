require 'lims-api/core_action_resource'
require 'lims-api/resources/container_to_uuid'

require 'lims-core/laboratory/transfer_plates_to_plates'

module Lims::Core
  module Laboratory
    class Plate
      class TransferPlatesToPlatesResource < CoreActionResource

        include ContainerToUuid

      end
    end
  end
end
