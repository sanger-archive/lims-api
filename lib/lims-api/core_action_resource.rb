require 'state_machine'
require 'facets/hash'

require 'lims-core'
require 'lims-api/json_encoder'
require 'lims-api/json_decoder'

require 'lims-api/resource'

module Lims
  module Api
    class CoreActionResource
      include Resource


      attr_reader :core_action_class, :name, :action

      # @param [Class] core_action_class
      # @param [String] name used to generate url (plural then)
      def initialize(context, core_action_class, name)
        @core_action_class= core_action_class
        @name = name
        super(context)
      end

      def actions
        # if action is nil, this resource
        # refers to a generical action
        # rather than an instance of one.
        # @todo use state_machine if other methods
        # depends on the current value of @action.
       @action ? [] :  [:create]
      end


      # Filter/preprocess attributes on creation
      # It a class method, because it is used before 
      # the instance is created
      #
      # @param [Hash] attributes
      # @param [Context] context
      # @param [Core::Persistence::Session] a session
      def self.filter_attributes_on_create(attributes, context, session)
        context.recursively_load_uuid(attributes, session)
      end

      def filtered_attributes()
        action.attributes-[:store]
      end

      #==================================================
      # Actions
      #==================================================

      def creator(attributes)
        create_attributes = attributes.fetch(name, {})

        lambda do 
          @action = @context.create_action(core_action_class, create_attributes)
          result = @context.execute_action(@action)
          @context.publish(core_action_class, self)
          self
        end
      end

      #==================================================
      # Encoders
      #==================================================
      #
      def content_to_stream(s, mime_type)
        object_to_stream(filtered_attributes, s, mime_type)
      end

      def object_to_stream(object, s, mime_type, in_hash = true)
        case object
        when Hash
          s.start_hash unless in_hash
          object.each  do |k, v|
            s.add_key k
            object_to_stream(v, s, mime_type, false)
          end
          s.end_hash unless in_hash
        when Core::Resource
          @context.encoder_for(object, [mime_type]).to_stream(s) 
        when Array
          s.with_array do
            object.each do |v|
              object_to_stream(v, s, mime_type, false)
            end
          end
        else
          s.add_value object
        end
      end

      private :object_to_stream

      # Specific encoder
      module  Encoder
        include Resource::Encoder

        def to_stream(s)
          s.tap do
            s.with_hash do
              if  object.action.valid?
                s.add_key object.name
                s.with_hash do
                  actions_to_stream(s)
                  object.content_to_stream(s, @mime_type)
                end
              else
                s.add_key :errors
                s.with_hash do
                  object.action.errors.keys.each do |k|
                    s.add_key k
                    s.add_value "invalid"
                  end
                end
              end
            end
          end
        end

        def status
          object.action.valid? ? 200 : 422
        end

        def url_for_action(action)
          url_for("actions/#{object.name}")
        end

      end

      Encoders = [
        class JsonEncoder
          include Encoder
          include Lims::Api::JsonEncoder
        end
      ]
      def self.encoder_class_map 
        @encoder ||= Encoders.mash { |k| [k::ContentType, k] }
      end

      #==================================================
      # Decoders
      #==================================================

      # Specific decoder
      module  Decoder
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
end
