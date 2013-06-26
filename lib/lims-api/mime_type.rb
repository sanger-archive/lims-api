require 'forwardable'

module Lims
  module Api
    # Represent a request MediaType or MimeType.
    # Can be used in the Accept or ContentType of the request header.
    # a MimeType as `type` and some parameters which can be accessed through `[]`.
    class MimeType
      extend Forwardable
      attr_reader :type
      def initialize(string)
        @type, *parameters = string.split(/\s*;\s*/)
        @parameters = {}
        parameters.each do |parameter|
          key, value = parameter.split(/\s*=\s*/, 2)
          @parameters[key]=value
        end
      end

      def to_s
        type.inspect
      end

      def_delegators :@parameters, :[], :each, :include?, :has_key?, :map

      def self.decode_header(header)
        header.split(/\s*,\s*/).map do |part|
          new(part)
        end
      end

      # Create a new MimeType if needed
      def self.to_mimetype(m)
        m.is_a?(String) ? self.new(m) : m
      end

    end
  end
end
