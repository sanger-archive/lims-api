module Lims::Api
  module Resources
    module Container
      def children_to_stream(s, mime_type)
        super(s, mime_type)
        s.add_key elements_name
        receptacles_to_stream(s, mime_type)
      end
    end
  end
end
