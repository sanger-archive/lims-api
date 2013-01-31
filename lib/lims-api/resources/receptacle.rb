#resource_helper.rb
module Lims::Api
  module Resources
    module Receptacle

      def receptacle_to_stream(s, receptacle, mime_type)
        s.with_array do
          receptacle.each do |aliquot|
            # unit is not an attribute, but a method, so we merge it to represent it in the JSON
            hash_to_stream(s, aliquot.attributes.merge("unit" => aliquot.unit), mime_type)
          end
        end
      end

    end
  end
end



