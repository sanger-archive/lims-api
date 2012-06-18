require 'lims-core'
require 'lims-api/json_encoder'

require 'lims-api/resource'
module Lims::Api
  class CoreResource
    include Resource
    # @param [String] model underlying model, part of the core
    def initialize(object)
      @object = object
    end


    #==================================================
    # Encoders
    #==================================================

    # Specific encoder
    module  Encoder
      include Resource::Encoder
      def to_struct
          object.attributes
      end
    end

    EncoderClassMap = [
      class JsonEncoder
        include Encoder
        include Lims::Api::JsonEncoder
      end
    ].mash { |k| [k::ContentType, k] }
  end
end
