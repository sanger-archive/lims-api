#spin_column_resource.rb
require 'lims-api/core_resource'
require 'lims-api/struct_stream'
require 'lims-api/resources/receptacle'

module Lims::Api
  module Resources
    class SpinColumnResource < CoreResource

      include Receptacle

      def content_to_stream(s, mime_type)
        s.add_key "aliquots"
        receptacle_to_stream(s, object, mime_type)
      end
    end
  end
end
