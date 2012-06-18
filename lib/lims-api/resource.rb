module Lims::Api
  module Resource
    def encoder_for(mime_types)
      encoder_class_for(mime_types).andtap { |k| k.new(self) }
    end


    # find first encoder available in {EncoderClassMap}.
    # @param [Array<String>] mime_types
    # @return [Class, nil]
    def encoder_class_for(mime_types)
      mime_types.each do |mime_type| 
        EncoderClassMap[mime_type].andtap { |k| return k }
      end
      nil
    end

    module Encoder
      def self.included(base)
        base.class_eval do
          attr_reader :object
        end
      end

      def initialize(object)
        @object = object
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
    end
  end
end
