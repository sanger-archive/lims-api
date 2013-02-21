module Lims::Api
  module Resources
    module ContainerToUuid

      def filtered_attributes
        super.tap do |attributes|
          attributes[:transfers]= attributes[:transfers].map.each do |transfer|
            transfer.mash do |k,v|
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
end
