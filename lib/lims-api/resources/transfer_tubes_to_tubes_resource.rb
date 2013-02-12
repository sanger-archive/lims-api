require 'lims-api/core_action_resource'

module Lims::Api
  module Resources
    class TransferTubesToTubesResource < CoreActionResource

      def filtered_attributes
        super.tap do |attributes|
          attributes[:transfers].each do |transfer|
            transfer["source_uuid"] = @context.uuid_for(transfer.delete("source"))
            transfer["target_uuid"] = @context.uuid_for(transfer.delete("target"))
          end
        end

#        new_attributes = {}
#        super.tap do |attributes|
#          attributes.each do |k,v|
#            if k.to_s == "transfers"
#              new_attributes[k] ||= []
#              attributes[k].each do |transfer|
#                h = {}
#                transfer.each do |tk, te|
#                  h[tk] = te unless ["source", "target"].include?(tk.to_s)
#                end
#                h["source_uuid"] = @context.uuid_for(transfer["source"])
#                h["target_uuid"] = @context.uuid_for(transfer["target"])
#                new_attributes[k] << h
#              end
#            else
#              new_attributes[k] = v
#            end
#          end
#        end
#        new_attributes
      end

      def content_to_stream(s, mime_type)
        filtered_attributes.each do |k,v|
          case v
          when Hash
            {:sources => :sources, :results => :targets, :targets => :targets}.each do |json_key, attribute|
              s.add_key json_key
              s.with_hash do
                s.add_key "tubes"
                s.with_array do
                  v[attribute].each do |r|
                    resource = @context.resource_for(r,@context.find_model_name(r.class))
                    resource.encoder_for([mime_type]).to_stream(s)
                  end
                end
              end
            end
          else
            s.add_key k
            s.add_value v
          end
        end
      end

    end
  end
end
