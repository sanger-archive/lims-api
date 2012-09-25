#resource_helper.rb
module Lims::Api
  module Resources
    module Helpers
      module Receptacle

        def receptacle_to_stream(s, receptacle)
          s.start_array
          receptacle.each do |aliquot|
            hash_to_stream(s, aliquot.attributes)
          end
          s.end_array
        end

      end
    end
  end
end



