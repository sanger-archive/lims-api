require 'lims-core'
require 'lims-api/json_encoder'

require 'lims-api/resource'
module Lims::Api
  # A CoreResource is a proxy to an instance of Core::Resource
  # It has a UuuidResource which embbed what's needed to load the object.
  # The object being lazy loaded when needed
  class CoreResource
    include Resource
    attr_reader :model_name 
    # @param [Core::Uuids::Resource] uuid_resource  a _link_ between the object and the database.
    # @param [String] model_name, the model name (used in URL generation)
    # @param [Resource, Nil] object if already in memory
    def initialize(uuid_resource, model_name,  object=nil)
      @uuid_resource = uuid_resource
      @model_name = model_name
      @object = object
    end

    # list of actions available on this object
    # @return [Array<String>]
    def actions
      %w[read create update delete]
    end

    # Render the underlying object as a Hash, attribute/values.
    # @return [Hash<String,Object>]
    def to_hash
      object.attributes
    end

    def object(session=nil)
      @object ||= begin
                    raise RuntimeError, "Can't load object without a session" unless session
                    session.object_for(@uuid_resource)
                  end
    end

    def uuid
      @uuid_resource.uuid
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
