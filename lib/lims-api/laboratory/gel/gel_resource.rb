#gel_resource.rb
require 'lims-api/resources/receptacle'
require 'lims-api/resources/container'
require 'lims-api/core_resource'
require 'lims-api/struct_stream'

require 'lims-core/laboratory/gel'

module Lims::Core
  module Laboratory
    class Gel
      class GelResource < Lims::Api::CoreResource

        include Receptacle
        include Container

        def elements_name
          "windows"
        end
      end
    end
  end
end
