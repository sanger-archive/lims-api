require 'json'

module Lims::Api
  module JsonEncoder
    ContentType = 'application/json'
    def content_type
      ContentType
    end

    def call
      to_struct.to_json
    end
  end
end
