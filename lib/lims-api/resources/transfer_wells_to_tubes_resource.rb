#plate_resource.rb
require 'lims-api/core_action_resource'
require 'lims-api/struct_stream'
module Lims::Api
  module Resources
    class TransferWellsToTubesResource < CoreActionResource
      # We needs to load tube from their uuid.
      # This is not by recursively_load_uuid because 
      # the key are well name and they don't contains uuid in it.
      def self.filter_attributes_on_create(attributes, context, session)
        super(attributes, context, session).tap  do |new_attributes|
          new_attributes["well_to_tube_map"].andtap { |h| h.update_values { |v| session[v] } }
        end
      end


      # We need to replace all tube by their uuid
      def filtered_attributes()
        super.tap do |attributes|
          attributes[:"well_to_tube_map"].andtap { |h| h.update_values { |v|  @context.uuid_for(v) || v } }
        end
      end
    end
  end
end
