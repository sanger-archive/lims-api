require 'json'
require 'lims-api/struct_stream'

module Lims::Api
  module JsonEncoder
    
    ContentType = 'application/json'
    def content_type
      ContentType
    end
    
    def call()
      stream = StructStream.new(content_type)
      to_stream(stream)
      stream.struct.to_json
    end
  end
end
