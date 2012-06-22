require 'lims-core'
require 'lims-api/json_encoder'

require 'lims-api/resource'
module Lims::Api
  class CoreClassResource
    include Resource

    attr_reader :name, :model

    # @param [String] model underlying model, part of the core
    def initialize(model, name)
      @model = model
      @name = name
    end

    def actions
      %w[create]
    end


    #==================================================
    # Encoders
    #==================================================

    # Specific encoder
    module  Encoder
      include Resource::Encoder
      def to_struct
        {
          object.name => {
          :actions => object.actions.mash { |a| [a, url_for_action(a)] }
        }}
      end

      def url_for_action(action)
        url_for("#{object.name}/#{action}")
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
