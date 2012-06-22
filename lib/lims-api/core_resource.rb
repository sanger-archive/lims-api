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

    # the name of the resource
    # return [String]
    def model_name
      @object.class.name
    end

    # list of actions available on this object
    # @return [Array<String>]
    def actions
      %w[read create update delete]
    end

    # Render the underlying object as a Hash, attribute/values.
    # @return [Hash<String,Object>]
    def to_hash
      @object.attributes
    end

    # The uuid of the underlying object
    # @return [String]
    def uuid
      @object.uuid
    end

    #==================================================
    # Encoders
    #==================================================

    # Specific encoder
    module  Encoder
      include Resource::Encoder
      def to_struct
        object.to_hash.merge({ object.model_name =>  {
          :actions => object.actions.mash { |a| [a, url_for_action(a) ] }
        }
        }
                            )
      end

      def url_for_action(action)
        path = case action
               when "read", "create", "update", "delete" then object.uuid
               end
        url_for(path)
      end

    end

    Encoders = [
      class JsonEncoder
        include Encoder
        include Lims::Api::JsonEncoder
      end
    ]

    def self.encoder_class_map 
      Encoders.mash { |k| [k::ContentType, k] }
    end
  end
end
