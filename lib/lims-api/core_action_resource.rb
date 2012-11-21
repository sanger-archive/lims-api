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



      #==================================================
      # Actions
      #==================================================

      def creator(attributes)
        lambda do 
          @action = @context.create_action(core_action_class, attributes)
          @context.execute_action(@action)
        self
        end
      end

      #==================================================
      # Encoders
      #==================================================
      #
      def content_to_stream(s, mime_type)
          (action.attributes-[:store]).each do |k,v|
          s.add_key k
            case v
            when Core::Resource
              resource = @context.resource_for(v,@context.find_model_name(v.class))
              resource.encoder_for([mime_type]).to_stream(s)
            else
              s.add_value v
            end
        end
      end

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
