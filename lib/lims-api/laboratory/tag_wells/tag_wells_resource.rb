require 'lims-api/core_action_resource'
require 'lims-api/struct_stream'

require 'lims-core/laboratory/tag_wells'

module Lims::Core
  module Laboratory
    class TagWells
      class TagWellsResource < Lims::Api::CoreActionResource
        def self.handle(well_to_tag_map, &block)
          well_to_tag_map.update_values(&block)
        end

        def self.filter_attributes_on_create(attributes, context, session)
          super.tap { |new_attributes| handle(new_attributes['well_to_tag_map'], &session.method(:[])) }
        end

        def filter_attributes
          super.tap { |attributes| self.handle(attributes[:well_to_tag_map], &method(:uuid_or_value)) }
        end

        def uuid_or_value(v)
          @context.uuid_for(v) || v
        end
        private :uuid_or_value
      end
    end
  end
end
