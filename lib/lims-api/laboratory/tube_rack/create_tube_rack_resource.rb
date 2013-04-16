require 'lims-api/core_action_resource'
require 'lims-api/struct_stream'

require 'lims-core/laboratory/tube_rack'
require 'lims-core/laboratory/tube_rack/create_tube_rack'

module Lims::Core
  module Laboratory
    class TubeRack
        class CreateTubeRackResource < Lims::Api::CoreActionResource

          def self.map_tubes(tubes, &block)
            tubes.update_values do |tube|
              tube = block[tube]
            end unless tubes.nil?
          end

          def self.filter_attributes_on_create(attributes, context, session)
            super.tap do |new_attributes|
              map_tubes(new_attributes["tubes"]) { |v| session[v] }  
            end
          end

          def filtered_attributes
            super.tap do |attributes|
              self.class.map_tubes(attributes[:tubes]) { |v| @context.uuid_for(v) || v }
            end
          end

        end
      end
    end
  end
