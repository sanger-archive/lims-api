#flowcell_resource.rb
require 'lims-api/core_resource'
require 'lims-api/struct_stream'
module Lims::Api
  module Resources
    class FlowcellResource < CoreResource

      def to_hash_old()
        {
          "flowcell" => {
            "lanes" =>  {}.tap do |h|
              object.each_with_index do |lane, id|
                # We want the lane to be seen as an array
                # without this, the lane is transformed into a string
                h[id]=lane.content.map { |action| action.attributes }
              end
            end
          }
        }
      end

      def to_hash()
        to_stream(StructStream.new).struct
      end

      def to_stream(s)
        s.tap do
          s.start_hash
          s.add_key "flowcell"
          content_to_stream(s)
          s.end_hash
        end
      end
      def content_to_stream(s)
        s.start_hash
        s.add_key "lanes"
        lanes_to_stream(s)
        s.end_hash
      end

      def lanes_to_stream(s)
        s.start_hash
        object.each_with_index do |lane, id|
          s.add_key (id+1).to_s
          lane_to_stream(s, lane)
        end
        s.end_hash
      end

      def lane_to_stream(s, lane)
        s.start_array
        lane.each do |aliquot|
          hash_to_stream(s, aliquot.attributes)
        end
        s.end_array
      end

    end
  end
end
