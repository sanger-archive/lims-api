unless defined?(Lims::Core::NO_AUTOLOAD)
  require 'lims-core'
end
require 'lims-api/json_encoder'
require 'lims-api/json_decoder'

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
    include Lims::Api::Resource
    attr_reader :model_name
    # @param [Core::Persistence::UuidResource] uuid_resource a _link_ between the object and the database.
    # @param [String] model_name, the model name (used in URL generation)
    # @param [Resource, Nil] object if already in memory
    def initialize(context, uuid_resource, model_name, object=nil)
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

    # Fill a stream with underlying object as a Hash, attribute/values.
    # @param [Stream]
    # @param [String] mime_type
    def content_to_stream(s, mime_type)
      object.attributes.each do |k, v|
        s.add_key k
        s.add_value v
      end
    end


    # Display underlying resources
    # To overrides
    def children_to_stream(s, mime_type)
    end

    # @todo: extract in LabellableResource when refactoring everything
    def labellable_to_stream(s, mime_type)
      return if defined?(Lims::Core::NO_AUTOLOAD)
      if @context.last_session
        @context.last_session.tap do |session|
          labellable = session.labellable[{:name => uuid, :type => "resource"}]
          if labellable
            s.add_key "labels"
            s.with_hash do
              resource = @context.resource_for(labellable, @context.find_model_name(labellable.class))
  
              resource.encoder_for([mime_type]).actions_to_stream(s)
              s.add_key "uuid"
              s.add_value resource.uuid
              resource.labels_to_stream(s, mime_type)
            end
          end
        end
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

    def updater(attributes)
      lambda {
        model_class = @context.find_model_class(model_name)
        raise "Wrong model" unless model_class
        # Depending of if theres is dedicated action class or not
        # we call it, or use a straight forward update
        if model_class.const_defined?(:Update)
          action_class = model_class::Update
          dedicated_action_for(action_class, attributes.merge(:"#{model_name}_uuid" => uuid))
        else
          @context.with_session do |session|
            object(session).tap do |o|
              o.update(attributes)
            end
            self
          end
        end
      }
    end

    def deleter
      lambda {
        model_class = @context.find_model_class(model_name)
        raise "Wrong model" unless model_class
        # Depending of if theres is dedicated action class or not
        # we call it, or use a straight forward delete
        if model_class.const_defined?(:Delete)
          action_class = model_class::Delete
          dedicated_action_for(action_class, :"#{model_name}_uuid" => uuid)
        else
          @context.with_session do |session|
            # load the object
            object(session)            
            session.delete_resource(@uuid_resource)
            self
          end
        end
      }
    end

    # @param [Class] action_class
    # @param [Hash] attributes
    # @return [Lims::Core::Resource]
    # Create the action action_class, execute it and publish
    # a message on the bus.
    def dedicated_action_for(action_class, attributes)
      action = @context.create_action(action_class, attributes)
      result = @context.execute_action(action)

      # We remove the uuid key so the only remaining one
      # is the object itself
      new_uuid = result.delete(:uuid)
      type = result.keys.first
      object = result[type]

      resource = @context.resource_for(object, type, new_uuid)
      @context.publish(action_class, resource)
      resource      
    end
    private :dedicated_action_for

    create_action(:creator) do |session, attributes|
      object(session).create(attributes)
    end

    #==================================================
    # Encoders
    #==================================================

    # Specific encoder
    module Encoder
      include Resource::Encoder
      def to_stream(s)
        s.tap do
          s.with_hash do
            s.add_key object.model_name.to_s
            s.with_hash do
              to_hash_stream(s)
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

      # Base function for all parameters specific encoder.
      # defining to_hash_stream (and use it as a default method
      # would be better, but doesn't work for some reason.
      # Sometime the 'default' one override the specific one.
      def to_hash_stream_base(h)
        actions_to_stream(h)
        h.add_key "uuid"
        h.add_value object.uuid
      end

      module Representation
        module Full
          # @param [HashStream] h
          def to_hash_stream(h)
            to_hash_stream_base(h)
            object.content_to_stream(h, @mime_type)
            object.children_to_stream(h, @mime_type)
            object.labellable_to_stream(h, @mime_type)
          end
        end

        module Attributes
          def to_hash_stream(h)
            to_hash_stream_base(h)
            object.content_to_stream(h, @mime_type)
            object.labellable_to_stream(h, @mime_type)
          end
        end

        module NoAttributes
          # @param [HashStream] h
          def to_hash_stream(h)
            to_hash_stream_base(h)
            object.children_to_stream(h, @mime_type)
          end
        end

        module Minimal
          def to_hash_stream(h)
            to_hash_stream_base(h)
          end
        end
      end

      include Representation::Full # default behavior

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

    #==================================================
      # Decoders
    #==================================================

      # Specific decoder
    module Decoder
      include Resource::Decoder
    end

    Decoders = [
      class JsonDecoder
        include Decoder
        include Lims::Api::JsonDecoder
      end
    ]
    def self.decoder_class_map
      @decoder ||= Decoders.mash { |k| [k::ContentType, k] }
    end
  end
end
