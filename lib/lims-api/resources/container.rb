module Lims::Api
  module Resources
    module Container

      def dimensions_to_stream(s)
        s.add_key "number_of_rows"
        s.add_value object.number_of_rows

        s.add_key "number_of_columns"
        s.add_value object.number_of_columns
      end

      def content_to_stream(s, mime_type)
        dimensions_to_stream(s)
        s.add_key elements_name
        receptacles_to_stream(s, mime_type)
      end
    end
  end
end
