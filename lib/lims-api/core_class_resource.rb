require 'lims-core'
require 'lims-api/json_encoder'

require 'lims-api/resource'
module Lims::Api
  class CoreClassResource
    include Resource
    # @param [String] model underlying model, part of the core
    def initialize(model)
      @model = model
    end

    def name
      @name ||= @model.name
    end

    def actions
      []
    end


    #==================================================
    # Encoders
    #==================================================

    # Specific encoder
    module  Encoder
      include Resource::Encoder
      def to_struct
        {
          object.name => {
          :actions => object.actions
        }}
      end
    end

    EncoderClassMap = [
      class JsonEncoder
        include Encoder
        include Lims::Api::JsonEncoder
      end
    ].mash { |k| [k::ContentType, k] }

    # find first encoder available
    # @param [Array<String>] mime_types
    # @return [Class, nil]
    def encoder_class_for(mime_types)
      mime_types.each do |mime_type| 
        EncoderClassMap[mime_type].andtap { |k| return k }
      end
      nil
    end
  end
end
