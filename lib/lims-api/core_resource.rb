require 'lims-core'
require 'lims-api/json_encoder'

require 'lims-api/resource'
require 'lims-api/struct_stream'
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
    def initialize(context, uuid_resource, model_name,  object=nil)
      @uuid_resource = uuid_resource
      @model_name = model_name
      @object = object
      super(context)
    end

    # list of actions available on this object
    # @return [Array<String>]
    def actions
      %w[read create update delete]
    end

    # Render the underlying object as a Hash, attribute/values.
    # @return [Hash<String,Object>]
    def to_hash_to_delete
      object.attributes
    end

    # Fill a stream with underlying object as a Hash, attribute/values.
    # @param [Stream]
    def content_to_stream(s)
      object.attributes.each do |k, v|
        s.add_key k
        s.add_value v
      end
    end

    def object(session=nil)
      @object ||= begin
                    raise RuntimeError, "Can't load object without a session" unless session
                    session[@uuid_resource]
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
      self
    end

    create_action(:updater) do |session, attributes|
      object(session).tap do |o|
        o.update(attributes)
      end
      self
    end

    create_action(:deleter) do |session|
      # load the object
      object(session)
      session.delete_resource(@uuid_resource)
      self
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
      def to_struct_to_delete
        object.to_hash.weave({ object.model_name.to_s =>  {
          :actions => object.actions.mash { |a| [a, url_for_action(a) ] }
        }
        }
                            )
      end
      def to_struct
        to_stream(StructStream.new).struct
      end

      def to_stream(s)
        s.tap do
          s.with_hash do
            s.add_key object.model_name.to_s
            s.with_hash do
              s.add_key :actions
              s.with_hash do
                object.actions.each do |a|
                  s.add_key a
                  s.add_value url_for_action(a)
                end
              end
              object.content_to_stream(s)
            end
          end
        end
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
