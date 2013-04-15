require 'lims-api/core_action_resource'
require 'lims-api/resources/create_container'

require 'lims-core/laboratory/gel'

module Lims::Core
  module Laboratory
	class Gel
	class CreateGelResource < CoreActionResource
	include CreateContainer

	def self.element_attr
	end
        'windows_description'
      end

      def self.element_attr_sym
        :windows_description
      end
    end
  end
end
