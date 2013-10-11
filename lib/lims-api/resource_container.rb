require 'lims-api/resource'

module Lims::Api
  # Contains some resource.
  # Can be encoded as an Array
  # or hash : name => [...]
  # if it has an name
  class ResourceContainer
    include Lims::Api::Resource
    attr_reader :name, :resources
    def initialize(context, resources, name=nil)
      super(context)
      @resources = resources
      @name = name
    end

    def actions
      []
    end

    module Encoder
      include Resource::Encoder
      def to_stream(s)
        if object.name
          s.start_hash
          actions_to_stream(s)
          s.add_key "size"
          s.add_value object.resources.size
          s.add_key object.name
        end

        s.with_array do
          object.resources.each do |resource|
            s.with_hash do
              resource.encoder_for([@mime_type]).to_hash_stream(s)
            end
          end
        end

        if object.name
          s.end_hash
        end
      end
    end

    Encoders = [
      class JsonEncoder
        include Encoder
        include Lims::Api::JsonEncoder
      end
    ]

    def self.encoder_class_map 
      @encoder ||= Encoders.mash { |k| [k::ContentType, k] }
    end
  end
end
