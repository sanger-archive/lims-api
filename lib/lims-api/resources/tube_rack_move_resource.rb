require 'lims-api/core_action_resource'
require 'lims-api/resources/container_to_uuid'

module Lims::Api
  module Resources
    class TubeRackMoveResource < CoreActionResource

      include ContainerToUuid

      def filtered_attributes
        super.tap do |attributes|
          attributes[:moves] = container_to_uuid(attributes, attributes[:moves])
        end
      end

    end
  end
end
