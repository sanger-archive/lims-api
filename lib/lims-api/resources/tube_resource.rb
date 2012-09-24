#tube_resource.rb
require 'lims-api/core_resource'
require 'lims-api/struct_stream'
module Lims::Api
  module Resources
    class TubeResource < CoreResource
      def to_hash()
        to_stream(StructStream.new).struct
      end

      def to_stream(s)
        s.tap do
          s.start_hash
          s.add_key "tube"
          content_to_stream(s)
          s.end_hash
        end
      end
      
      def content_to_stream(s)
        s.add_key "aliquots"
        aliquots_to_stream(s)
      end

      def aliquots_to_stream(s)
        s.start_array
        object.each do |aliquot|
          hash_to_stream(s, aliquot.attributes)
        end
        s.end_array
      end

    end
  end
end
