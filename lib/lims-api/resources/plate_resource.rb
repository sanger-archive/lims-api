require 'lims-api/core_resource'
module Lims::Api
  module Resources
    class PlateResource < CoreResource

      def to_hash()
        {
          :plate => {
              :wells =>  {}.tap do |h|
              object.each_with_index do |well, name|
                h[name]=well
              end
            end
          }
        }
      end
    end
  end
end
