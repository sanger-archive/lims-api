module Lims::Api
  module Resources
    module ContainerToUuid

      def container_to_uuid(attributes, method)
        method.map.each do |element|
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
  end
end
