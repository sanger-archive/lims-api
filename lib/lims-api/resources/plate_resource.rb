require 'lims-api/core_resource'
require 'lims-api/struct_stream'
module Lims::Api
  module Resources
    class PlateResource < CoreResource
      def to_stream(s)
        s.tap do
          s.start_hash
          s.add_key "plate"
        s.start_hash
          content_to_stream(s)
        s.end_hash
          s.end_hash
        end
      end
      def content_to_stream(s)
        s.add_key "wells"
        wells_to_stream(s)
      end

      def wells_to_stream(s)
        s.start_hash
        object.each_with_index do |well, name|
          s.add_key name
          well_to_stream(s, well)
        end
        s.end_hash
      end

      def well_to_stream(s, well)
        s.start_array
        well.each do |aliquot|
          hash_to_stream(s, aliquot.attributes)
        end
        s.end_array
      end

    end
  end
end
