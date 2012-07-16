require 'lims-core'
require 'lims-api/json_encoder'

require 'lims-api/resource'
require 'facets/hash'
module Lims::Api
  # A CoreResource is a proxy to an instance of Core::Resource
  # It has a UuuidResource which embbed what's needed to load the object.
  # The object being lazy loaded when needed
  # CoreResource can be derived, the Context class will try to find the corresponding class under
  # Lims::Api::Resources:: or use CoreResource by default.
  # Example : if defined Laboratory::Plate will use Lims::Api::Resources::PlateResource.
  class CoreResource
    include Resource
    attr_reader :model_name 
    # @param [Core::Uuids::UuidResource] uuid_resource  a _link_ between the object and the database.
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
    # Actions
    #==================================================

    create_action(:reader) do |session|
      object(session)
    end

    create_action(:updater) do |session, attributes|
      object(session).tap do |o|
        o.update(attributes)
      end
    end

    create_action(:deleter) do |session|
      session.delete_resource(@uuid_resource)
    end

    create_action(:creator) do |session, attributes|
        object(session).create(attributes)
    end
    #==================================================
    # Encoders
    #==================================================

    # Specific encoder
    module  Encoder
      include Resource::Encoder
      def to_struct
        object.to_hash.weave({ object.model_name =>  {
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
