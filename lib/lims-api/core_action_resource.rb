require 'state_machine'
require 'facets/hash'

unless defined?(Lims::Core::NO_AUTOLOAD)
require 'lims-core/actions'
end
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

      # in_result parameter in set to true if we are in a hash which has "result"
      # as a key. It's useful to avoid having duplicate keys in the result part of
      # the json. Note that it must be done only for the result section. Other parts
      # of the json like sources and targets in a transfer for example remain the same.
      # parent_key parameter is needed to determine if we want to add the resource key
      # in the json or not. For example, we want tubes => [{}, {}] instead of 
      # tubes => [{tube => {}}, {tube => {}}].
      def object_to_stream(object, s, mime_type, in_hash = true, in_result = false, parent_key = nil)
        case object
        when Hash
          s.start_hash unless in_hash
          object.each  do |k, v|
            s.add_key k
            object_to_stream(v, s, mime_type, false, k.to_s == "result" || in_result, k.to_s)
          end
          s.end_hash unless in_hash
        when Core::Resource
          encoder = @context.encoder_for(object, [mime_type])
          plural_object_name = "#{encoder.object.model_name}s"
          if in_result || parent_key == plural_object_name
            s.with_hash do
              encoder.to_hash_stream(s)
            end
          else
            encoder.to_stream(s)
          end
        when Array
          s.with_array do
            object.each do |v|
              object_to_stream(v, s, mime_type, false, false, parent_key)
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
              s.add_key object.name
              s.with_hash do
                actions_to_stream(s)
                object.content_to_stream(s, @mime_type)
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
