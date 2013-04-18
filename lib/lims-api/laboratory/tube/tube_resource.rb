#tube_resource.rb
require 'lims-api/core_resource'
require 'lims-api/struct_stream'
require 'lims-api/resources/receptacle'

require 'lims-core/laboratory/tube'

module Lims::Core
  module Laboratory
    class Tube
      class TubeResource < Lims::Api::CoreResource

        include Lims::Api::Resources::Receptacle

        def content_to_stream(s, mime_type)
          super(s, mime_type)
          s.add_key "aliquots"
          receptacle_to_stream(s, object, mime_type)
        end

      end
    end
  end
end
