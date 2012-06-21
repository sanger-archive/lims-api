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

    def name
      object.class.name
    end

    def actions
      %w[read create update delete]
    end

    #==================================================
    # Encoders
    #==================================================

    # Specific encoder
    module  Encoder
      include Resource::Encoder
      def to_struct
        object.attributes.merge {
          object.name =>  {
            :actions => object.actions.mash { |a| [a, url_for_action(a) ] }
          }
        }
      end

      def url_for_action(action)
        path = case actions
               when :read then object.uuid
               end
        url_for(path)
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
