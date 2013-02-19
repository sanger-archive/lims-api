require 'lims-api/core_action_resource'
require 'lims-api/resources/create_container'

module Lims::Api
  module Resources
    class CreateGelResource < CoreActionResource
      include CreateContainer

      def self.element_attr
        'windows_description'
      end

      def self.element_attr_sym
        :windows_description
      end
    end
  end
end
