require 'facets/enumerable'
module Resource
  def encoder_for(mime_types)
    encoder_class_for(mime_types).nef(self)
  end

  module ResourceEncoder
    def call
      %Q{{"action":{"resource":{"class":#{resource.class.name.inspect},"name":#{resource.name.inspect}},"name":#{name.inspect}}}}
    end
  end

  class JsonEncoder
    include Lims::Api::JsonEncoder
    include ResourceEncoder
  end

  EncoderMap = [JsonEncoder].mash { |klass| [klass.content_type, klass] }
  def self.encoder_class_for(mime_types)
    EncoderMap[mime_types.to_s]
  end
end
