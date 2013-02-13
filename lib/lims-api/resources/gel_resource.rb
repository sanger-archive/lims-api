#gel_resource.rb
require 'lims-api/resources/receptacle'
require 'lims-api/resources/container'
require 'lims-api/core_resource'
require 'lims-api/struct_stream'

module Lims::Api
  module Resources
    class GelResource < CoreResource

      include Receptacle
      include Container

      def elements_name
        "windows"
      end
    end
  end
end
