require 'lims-api/core_action_resource'
require 'lims-api/struct_stream'

module Lims::Api
  module Resources
    class CreatePlateResource < CoreActionResource
      UUID_FIELDS_IN_ALIQUOT = [ 'sample', 'tag' ]

      # Utility method for ensuring that the UUID fields in each aliquot of the well description
      # hash is mapped correctly.  The block controls the direction of the mapping.
      def self.map_well_descriptions(wells_description, &block)
        wells_description.update_values do |aliquots|
          aliquots.map do |aliquot|
            aliquot.update(aliquot.subset(UUID_FIELDS_IN_ALIQUOT).update_values(&block))
          end
        end unless wells_description.nil?
      end

      def self.filter_attributes_on_create(attributes, context, session)
        super.tap do |new_attributes|
          map_well_descriptions(new_attributes['wells_description']) { |v| session[v] }
        end
      end

      def filtered_attributes
        super.tap do |attributes|
          self.class.map_well_descriptions(attributes[:wells_description]) { |v| @context.uuid_for(v) || v }
        end
      end
    end
  end
end
