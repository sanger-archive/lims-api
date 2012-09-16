require 'state_machine'
require 'facets/hash'

require 'lims-core'
require 'lims-api/json_encoder'
require 'lims-api/json_decoder'

require 'lims-api/resource'
require 'lims-api/struct_stream'

module Lims
  module Api
    class CoreResourcePage
      include Resource

      UnloadedError = Class.new(RuntimeError)

      attr_reader :name, :model, :page_number, :number_per_page 

      # @param [Class] model underlying model, part of the core
      # @param [String] name used to generate url (plural then)
      # @param [Integer] page_number
      # @param [Integer] number_per_page
      def initialize(context, model, name, page_number, number_per_page)
        @model= model
        @name = name
        @page_number = page_number
        @number_per_page = number_per_page
        super(context)
      end

      state_machine :state, :initial => :unloaded do
        event :load! do
          transition :unloaded => :loaded
        end
        state :unloaded do
          def actions
            raise UnloadedError, "objects not loaded. Can't call method action."
          end
          def number_of_pages
            raise UnloadedError, "objects not loaded. Can't call method action."
          end
        end

        state :loaded do
          def number_of_pages
            @number_of_pages ||= [1, (@object_number+@number_per_page-1)/@number_per_page].max
          end

          def actions
            %w[read].tap do |as| 
              as << "next" if page_number < number_of_pages
              as << "previous" if page_number > 1
            end
          end

          # We don't provide a map operator but not only an each one
          # to encourage lazzy/stream-friendly encoding agains map
          # Note : the map operator can be easily be build fro this
          def for_each_object(&block)
            @object_iterator.each do |object|
              uuid=@context.uuid_for(object)
              resource = @context.resource_for(object, name, uuid)
              block[resource]
            end
          end
        end
      end

      def first_index
        [(page_number-1)*(number_per_page), 0].max
      end

      def last_index
        [first_index+number_per_page-1, [@object_number-1, 0].max].min
      end

      def length
        [@object_number, last_index-first_index+1].min
      end

      def load_objects(session)
        @object_number  = @context.model_count(session, model)
        @object_iterator = session.persistor_for(model).slice(first_index, length)
        load!
        @page_number =  number_of_pages if @page_number== -1
      end

      #==================================================
      # Actions
      #==================================================

      create_action(:reader) do |session|
        load_objects(session)
        self
      end

      #==================================================
      # Encoders
      #==================================================

      # Specific encoder
      module  Encoder
        include Resource::Encoder

        def to_stream(s)
          s.tap do
            s.with_hash do
              s.add_key object.name
              s.with_hash do
              actions_to_stream(s)
                s.add_key object.name
                s.with_array do
                  object.for_each_object do |object|
                    s.with_hash do
                      s.add_key "uuid"
                      s.add_value object.uuid
                      object.content_to_stream(s)
                    end
                  end
                end
              end
            end
          end
        end

        def url_for_page(page_number)
          url_for("#{object.name}/page=#{page_number}")
        end

        def url_for_action(action)
          case action.to_sym
          when :read
            url_for_page(object.page_number)
            # We don't need at that point to check the existance of previous/next page
            # as that will be filtered by the {actions} method.
          when :next
            url_for_page(object.page_number+1)
          when :previous
            url_for_page(object.page_number-1)
          else
            raise RuntimeError, "Unexpected action '#{action}'"
          end
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
