#plate_resource.rb
require 'lims-api/resources/receptacle'
require 'lims-api/resources/container'
require 'lims-api/core_resource'
require 'lims-api/struct_stream'

require 'lims-core/laboratory/plate'
module Lims::Api
  module Laboratory
    class Plate
      class PlateResource < CoreResource

        include Receptacle
        include Container

        def elements_name
          "wells"
        end

      end
    end
  end
end
