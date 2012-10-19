#sample_resource.rb
require 'lims-api/core_resource'
require 'lims-api/struct_stream'

module Lims::Api
  module Resources
    class SampleResource < CoreResource

      def content_to_stream(s)
        # Do nothing
      end
    end
  end
end