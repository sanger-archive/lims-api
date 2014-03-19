require 'lims-api/core_resource'
require 'lims-core/persistence/user_session'
module Lims::Core
  module Persistence
    class UserSession
      class UserSessionResource < Lims::Api::CoreResource
        def initialize(*args)
          super(*args)
        end

        module Encoder
      def to_hash_stream_base(h)
        actions_to_stream(h)
      end
      def url_for_action(action)
      url_for("")
    end
        end
    Encoders = [
      class JsonEncoder
        include Lims::Api::CoreResource::Encoder
        include Lims::Api::JsonEncoder
        include Encoder
      end
    ]

    def self.encoder_class_map
      Encoders.mash { |k| [k::ContentType, k] }
    end
      end
    end
  end
end
