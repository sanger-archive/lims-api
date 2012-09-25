#flowcell_resource.rb
require 'lims-api/resources/receptacle_resource'
require 'lims-api/core_resource'
require 'lims-api/struct_stream'
module Lims::Api
  module Resources
    class FlowcellResource < CoreResource
      
      include Receptacle

      def content_to_stream(s)
        s.add_key "number_of_lanes"
        s.add_value object.number_of_lanes 
        s.add_key "lanes"
        lanes_to_stream(s)
      end

      def lanes_to_stream(s)
        s.start_hash
        object.each_with_index do |lane, id|
          s.add_key (id+1).to_s
          receptacle_to_stream(s, lane)
        end
        s.end_hash
      end

    end
  end
end
