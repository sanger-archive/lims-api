module Lims::Api
  module Resources
    module ContainerToUuid

      # This method changes the containers in the transfer part of the JSON
      # (plate, gel, tube rack or filter paper) to their uuid's to match 
      # the request JSON.
      def filtered_attributes
        super.tap do |attributes|
          attributes[transfer_method] = attributes[transfer_method].map.each do |element|
            replace_attributes_resources_with_uuid(element)
          end
        end
      end

      # The default transfer method,
      # it can be overrided by the specific resource
      def transfer_method
        :transfers
      end

      # This is a helper method to change the JSON of the containers
      # (plate, gel, tube rack or filter paper) to their uuid's to match
      # the request JSON.
      def replace_attributes_resources_with_uuid(element)
        element.mash do |k,v|
          case k
          when "source", :source
            [:source_uuid,  @context.uuid_for(v)]
          when "target", :target
            [:target_uuid, @context.uuid_for(v)]
          else
            [k,v]
          end
        end
      end

    end
  end
end
