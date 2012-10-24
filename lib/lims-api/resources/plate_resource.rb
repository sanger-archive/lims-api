#plate_resource.rb
require 'lims-api/resources/receptacle'
require 'lims-api/core_resource'
require 'lims-api/struct_stream'
module Lims::Api
  module Resources
    class PlateResource < CoreResource
     
      include Receptacle

      def content_to_stream(s, mime_type)
        s.add_key "wells"
        wells_to_stream(s, mime_type)
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
