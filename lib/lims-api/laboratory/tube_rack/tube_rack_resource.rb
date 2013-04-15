require 'lims-api/resources/container'
require 'lims-api/core_resource'
require 'lims-api/struct_stream'

require 'lims-core/laboratory/tube_rack'
module Lims::Core
  module Laboratory
    class TubeRack
      class TubeRackResource < Lims::Api::CoreResource

        include Container

        def content_to_stream(s, mime_type)
          dimensions_to_stream(s)
          s.add_key "tubes"
          tubes_to_stream(s, mime_type)
        end

        def tubes_to_stream(s, mime_type)
          tubes = {}
          object.each_with_index { |tube, location| tubes[location] = tube }
          hash_to_stream(s, tubes, mime_type)
        end

      end
    end
  end
end
