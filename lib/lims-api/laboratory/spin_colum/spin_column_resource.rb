#spin_column_resource.rb
require 'lims-api/core_resource'
require 'lims-api/struct_stream'
require 'lims-api/resources/receptacle'

require 'lims-core/laboratory/spin_column'

module Lims::Api
  module Laboratory
    class SpinColumn
      class SpinColumnResource < CoreResource

        include Receptacle

        def content_to_stream(s, mime_type)
          s.add_key "aliquots"
          receptacle_to_stream(s, object, mime_type)
        end
      end
    end
  end
end
