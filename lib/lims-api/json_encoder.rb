require 'json'
require 'lims-api/struct_stream'

module Lims::Api
  module JsonEncoder

    ENCODER_VERSION = "3"
    ContentType = 'application/json'
    def content_type
      ContentType
    end

    def call()
      stream = StructStream.new
      to_stream(stream)
      stream.struct.merge({:version=> ENCODER_VERSION}).to_json
    end
  end
end
