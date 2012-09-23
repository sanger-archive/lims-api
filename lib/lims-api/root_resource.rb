require 'lims-api/resource'
require 'lims-api/json_encoder'

module Lims
  module Api
    # Resource displaying a Table of Content
    # of the available resources
    class RootResource
      include Resource

      attr_reader :resource_map
      def initialize(context, resource_map)
        @resource_map = resource_map
        super(context) 
      end

      def actions
        %w[read]
      end
      create_action :reader do |session|
        self
      end

      module Encoder
        include Resource::Encoder

        def to_stream(s)
          s.with_hash do
            actions_to_stream(s)
            object.resource_map.each do |name, resource|
              s.add_key name
              s.with_hash do
                resource.encoder_for([@mime_type]).actions_to_stream(s)
              end
            end
          end
        end

      def url_for_action(action)
        url_for('')
      end
      end
      Encoders = [
        class JsonEncoder
          include Encoder
          include Lims::Api::JsonEncoder
        end
      ]
      def self.encoder_class_map 
        Encoders.mash { |k| [k::ContentType, k] }
      end
    end
  end
end
