require 'lims-api/core_action_resource'
require 'lims-api/resources/container_to_uuid'

module Lims::Api
  module Resources
    class TransferTubesToTubesResource < CoreActionResource

      include ContainerToUuid

      def filtered_attributes
        super.tap do |attributes|
          attributes[:transfers] = container_to_uuid(attributes, attributes[:transfers])
        end
      end

    end
  end
end
