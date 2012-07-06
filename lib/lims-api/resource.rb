module Lims::Api
  module Resource
    def encoder_for(mime_types, url_generator)
      encoder_class_for(mime_types).andtap { |k| k.new(self, url_generator) }
    end


    # find first encoder available in {EncoderClassMap}.
    # @param [Array<String>] mime_types
    # @return [Class, nil]
    def encoder_class_for(mime_types)
      mime_types.each do |mime_type| 
        self.class.encoder_class_map[mime_type].andtap { |k| return k }
      end
      nil
    end


    # Map of Encoder classes by mime_type
    # @return [Hash<String, Class>]
    def self.encoder_class_map
      raise NotImplemtedError, "encoder_class_map"
    end

    module Encoder
      def self.included(base)
        base.class_eval do
          attr_reader :object
        end
      end

      def initialize(object, url_generator)
        @object = object      
        @url_generator = url_generator
      end

      def status
        200
      end

      # @abstract
      # @return [String]
      def content_type
        raise NotImplementedError, "Encoder::content_type"
      end

      def status
        200
      end

      # @abstract
      # encode the underlying object to string.
      # @return [String]
      def call
        raise NotImplementedError, "Encoder::call"
      end

      # @abstract
      # Called to be converted into json or anything else.
      # @return [Hash, Array]
      def to_struct
        raise NotImplementedError, "Encoder::to_struct"
      end

      def url_for(arg)
        case arg
          when String, Symbol then @url_generator.call(arg)
        end
      end
    end
  end
end
