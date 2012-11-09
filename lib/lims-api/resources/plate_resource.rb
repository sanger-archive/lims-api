#plate_resource.rb
require 'lims-api/resources/receptacle'
require 'lims-api/core_resource'
require 'lims-api/struct_stream'
module Lims::Api
  module Resources
    class PlateResource < CoreResource
     
      include Receptacle

      def content_to_stream(s, mime_type)
        dimension_to_stream(s)
        s.add_key "wells"
        wells_to_stream(s, mime_type)
      end

      def dimension_to_stream(s)
        s.add_key "dimension"
        s.with_hash do
          s.add_key "number_of_rows"
          s.add_value object.number_of_rows

          s.add_key "number_of_columns"
          s.add_value object.number_of_columns
        end
      end

      def wells_to_stream(s, mime_type)
        s.start_hash
        object.each_with_index do |well, name|
          s.add_key name
          receptacle_to_stream(s, well, mime_type)
        end
        s.end_hash
      end


    end
  end
end
