require 'lims-core'
require 'lims-api/json_encoder'
require 'lims-api/json_decoder'

require 'lims-api/resource'
require 'lims-api/core_resource_page'
require 'lims-api/struct_stream'

module Lims
  module Api
    class CoreClassResource
      include Resource

      NUMBER_PER_PAGES = 2

      attr_reader :name, :model

      # @param [Class] model underlying model, part of the core
      # @param [String] name used to generate url
      def initialize(context, model, name)
        @model = model
        @name = name
        super(context)
      end

      def actions
        %w[create read first last] 
      end


      def action(action_name)
        case action_name
        when /page=(-?\d+)/
          CoreResourcePage.new(@context, model, name, $1.to_i, NUMBER_PER_PAGES)
        end
      end
      #==================================================
      # Actions
      #==================================================

      create_action(:reader) do |session|
        self
      end



      # Move in Json encoder
      #create_action(:creator) do |session, attributes|
      def creator(attributes)
        create_attributes = attributes.fetch(@context.find_model_name(model), {})

        lambda do 
          action = @context.create_action(model::Create, create_attributes)
          r = @context.execute_action(action)
          uuid = r.delete(:uuid)
          type = r.keys.first
          object = r[type]
          @context.resource_for(object, type, uuid)
        end
      end


      #==================================================
      # Encoders
      #==================================================

      # Specific encoder
      module  Encoder
        include Resource::Encoder
        def to_stream(s)
          s.with_hash do
            s.add_key object.name
            s.with_hash do
              actions_to_stream(s)
            end
          end
        end

        def path
          object.name
        end

        def url_for_action(action)
          url_for(
            case action
            when "first" then "#{path}/page=1"
            when "last" then "#{path}/page=-1"
            when "read", "create" then "#{path}"
            else
              "#{path}/#{action}"
        end
        )
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
