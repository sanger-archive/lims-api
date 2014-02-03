require 'lims-api/mime_type'

module Lims::Api
  # Base module for Encoder and Decoder.
  # Provides a mime-type parameter "contextualisation"
  # by including on the fly module with name corresponding
  # to parameters.
  module MimeTyped
    def initialize(mime_type)
      set_mime_type(mime_type)
    end

    def set_mime_type(mime_type)
      @mime_type = MimeType::to_mimetype(mime_type)

      # include module corresponding to parameters if exists
      # we try to include module with the form k::v
      # example : LevelOfDetail::Minimum
      # or the key itself if the value is true
      @mime_type.each do |k,v|
        module_name = k.camelize
        if self.class.const_defined?(module_name)
          mod = self.class.const_get(module_name)
          if v == "true" or v == true
            self.extend mod
          else
            submodule_name = v.to_s.gsub("-", "_").camelize
            if mod.const_defined?(submodule_name)
              submodule = mod.const_get(submodule_name)
              self.extend submodule
            end
          end
        end
      end
    end

    private :set_mime_type

  end
end
