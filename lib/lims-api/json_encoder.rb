require 'lims-core/helpers'
require 'lims-api/struct_stream'

module Lims::Api
  module JsonEncoder
    
    ContentType = 'application/json'
    def content_type
      ContentType
    end
    
    def call()
      stream = StructStream.new
      to_stream(stream)
      Lims::Core::Helpers::to_json(stream.struct)
    end
  end
end
