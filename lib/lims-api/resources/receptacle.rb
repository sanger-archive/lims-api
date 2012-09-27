#resource_helper.rb
module Lims::Api
  module Resources
    module Receptacle

      def receptacle_to_stream(s, receptacle)
        s.with_array do
          receptacle.each do |aliquot|
            hash_to_stream(s, aliquot.attributes)
          end
        end
      end

    end
  end
end



