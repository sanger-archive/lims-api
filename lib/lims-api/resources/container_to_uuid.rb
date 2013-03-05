module Lims::Api
  module Resources
    module ContainerToUuid

      # This method changes the JSON of the containers (plate, gel or tube rack)
      # to their related uuid's to match the request JSON.
      def filtered_attributes
        super.tap do |attributes|
          attributes[transfer_method] = attributes[transfer_method].map.each do |element|
            element.mash do |k,v|
              case k
              when "source"
                ["source_uuid",  @context.uuid_for(v)]
              when "target"
                ["target_uuid", @context.uuid_for(v)]
              else
                [k,v]
              end
            end
          end
        end
      end

      # The default transfer method,
      # it can be overrided by the specific resource
      def transfer_method
        :transfers
      end

    end
  end
end
