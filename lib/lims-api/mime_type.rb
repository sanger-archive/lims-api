module Lims
  module Api
    # Represent a request MediaType or MimeType.
    # Can be used in the Accept or ContentType of the request header.
    # a MimeType as `type` and some parameters which can be accessed through `[]`.
    class MimeType
      attr_reader :type
      def initialize(string)
        @type, *parameters = string.split(/\s*;\s*/)
        @parameters = {}
        parameters.each do |parameter|
          key, value = parameter.split(/\s*=\s*/, 2)
          @parameters[key.to_sym]=value
        end
      end

      def [](key)
        @parameters[key.to_sym]
      end
    end
  end
end
