require 'lims-core/helpers'

module Lims::Api
  module JsonDecoder
    ContentType = 'application/json'
    def content_type
      ContentType
    end

    # @param [StringIO] str
    def call(io)
      Lims::Core::Helpers::load_json(io.read)
    end
  end
end
