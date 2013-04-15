#flowcell_resource.rb
require 'lims-api/resources/receptacle'
require 'lims-api/core_resource'
require 'lims-api/struct_stream'

require 'lims-core/laboratory/flowcell'

module Lims::Api
  module Laboratory
    class Flowcell
      class FlowcellResource < CoreResource

        include Receptacle

        def content_to_stream(s, mime_type)
          s.add_key "number_of_lanes"
          s.add_value object.number_of_lanes 
          s.add_key "lanes"
          lanes_to_stream(s, mime_type)
        end

        def lanes_to_stream(s, mime_type)
          s.start_hash
          object.each_with_index do |lane, id|
            s.add_key (id+1).to_s
            receptacle_to_stream(s, lane, mime_type)
          end
          s.end_hash
        end

      end
    end
  end
end
