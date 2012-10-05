require 'json'
require 'lims-api/struct_stream'

module Lims::Api
  module JsonEncoder
    
    ContentType = 'application/json'
    def content_type
      ContentType
    end
    
    def encoder_version
      3
    end

    def call()
      stream = StructStream.new
      to_stream(stream)
      stream.struct.to_json
    end
  end
end
