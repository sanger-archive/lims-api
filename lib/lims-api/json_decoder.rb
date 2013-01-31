require 'json'

module Lims::Api
  module JsonDecoder
    ContentType = 'application/json'
    def content_type
      ContentType
    end

    # @param [StringIO] str
    def call(io)
      JSON.parse(io.read)
    end
  end
end
