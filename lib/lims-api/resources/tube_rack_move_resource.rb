require 'lims-api/core_action_resource'
require 'lims-api/resources/container_to_uuid'

module Lims::Api
  module Resources
    class TubeRackMoveResource < CoreActionResource

      include ContainerToUuid

      # Overrides the default transfer method
      def transfer_method
        :moves
      end

    end
  end
end
