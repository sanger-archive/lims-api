require 'lims-api/resources/receptacle'
require 'lims-api/core_resource'
require 'lims-api/struct_stream'
module Lims::Api
  module Resources
    class LabellableResource < CoreResource

      def content_to_stream(s, mime_type)
        s.add_key "name"
        s.add_value object.name
        s.add_key "type"
        s.add_value object.type
        s.add_key "labels"
        s.with_hash do
          labels_to_stream(s, mime_type)
        end
      end

      def labels_to_stream(s, mime_type)
        object.each do |position, label|
          s.add_key position
          s.start_hash
          s.add_key "value"
          s.add_value label.value
          s.add_key "type"
          s.add_value label.type
          s.end_hash
        end
      end
    end
  end
end
