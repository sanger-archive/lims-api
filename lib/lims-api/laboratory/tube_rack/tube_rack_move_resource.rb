require 'lims-api/core_action_resource'
require 'lims-api/resources/container_to_uuid'

require 'lims-core/laboratory/tube_rack/tube_rack_move'

module Lims::Core
  module Laboratory
    class TubeRack
      class TubeRackMoveResource < CoreActionResource

        include ContainerToUuid

        # Overrides the default transfer method
        def transfer_method
          :moves
        end

      end
    end
  end
end
