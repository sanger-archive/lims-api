require 'lims-core'
require 'lims-api/json_encoder'
require 'lims-api/json_decoder'

require 'lims-api/resource'

module Lims
  module Api
    class CoreClassResource
      include Resource

      attr_reader :name, :model

      # @param [String] model underlying model, part of the core
      def initialize(model, name)
        @model = model
        @name = name
      end

      def actions
        %w[create]
      end

      #==================================================
      # Actions
      #==================================================

      create_action(:reader) do |session|
        self
      end


      #create_action(:creator) do |session, attributes|
      def creator(context, attributes)
        lambda do 
          action = model::Create.new( :store => context.store) do |a|
            attributes.each do |k,v|
              a[k] = v
            end
          end
          r = action.call
          uuid = r.delete(:uuid)
          type = r.keys.first
          object = r[type]
          context.resource_class_for(object).new(Core::Uuids::UuidResource.new(:uuid => uuid),  type,
                           object)

        end
      end


      #==================================================
      # Encoders
      #==================================================

      # Specific encoder
      module  Encoder
        include Resource::Encoder
        def to_struct
          {
            object.name => {
            :actions => object.actions.mash { |a| [a, url_for_action(a)] }
          }}
        end

        def url_for_action(action)
          url_for("#{object.name}/#{action}")
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
        def to_struct
          {
            object.name => {
            :actions => object.actions.mash { |a| [a, url_for_action(a)] }
          }}
        end

        def url_for_action(action)
          url_for("#{object.name}/#{action}")
        end
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
