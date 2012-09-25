require 'lims-api/core_resource'
require 'lims-api/struct_stream'
require 'lims-api/resources/resource_helper'
module Lims::Api
  module Resources
    class PlateResource < CoreResource
     
      include Helpers::Receptacle

      def content_to_stream(s)
        s.add_key "wells"
        wells_to_stream(s)
      end

      def wells_to_stream(s)
        s.start_hash
        object.each_with_index do |well, name|
          s.add_key name
          receptacle_to_stream(s, well)
        end
        s.end_hash
      end


    end
  end
end
