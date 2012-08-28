require 'lims-api/core_resource'
require 'lims-api/struct_stream'
module Lims::Api
  module Resources
    class PlateResource < CoreResource

      def to_hash_old()
        {
          "plate" => {
          "wells" =>  {}.tap do |h|
          object.each_with_index do |well, name|
            # We want the well to be seen as an array
            # without this, the well is transformed into a string
            h[name]=well.content.map { |a| a.attributes }
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
