require 'lims-api/core_resource'
module Lims::Api
  module Resources
    class PlateResource < CoreResource

      def to_hash()
        {
          "plate" => {
              "wells" =>  {}.tap do |h|
              object.each_with_index do |well, name|
                # We want the well to be seen as an array
                # without this, the well is transformed into a string
                h[name]=well.content
              end
            end
          }
        }
      end
    end
  end
end
