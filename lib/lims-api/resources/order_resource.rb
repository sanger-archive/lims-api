#order_resource.rb
require 'lims-api/core_resource'
require 'lims-api/struct_stream'
module Lims::Api
  module Resources
    class OrderResource < CoreResource

      def content_to_stream(s, mime_type)
        super(s, mime_type)
        object_to_stream("creator", object.creator, s, mime_type)
        object_to_stream("study", object.study, s, mime_type)
        items_to_stream(s)
      end

      # Get back the resource {obj} and add it into the stream
      # @param [String] key to print in the stream 
      # @param [Lims::Core::Resource] obj
      # @param [StructStream] s
      # @param [String] mime_type
      def object_to_stream(key, obj, s, mime_type)
        s.add_key key
        resource = @context.resource_for(obj, @context.find_model_name(obj.class))
        s.with_hash do
          resource.encoder_for([mime_type]).actions_to_stream(s)
          s.add_key "uuid"
          s.add_value resource.uuid
        end
      end

      # Add order items into the stream as {role : [{:uuid => uuid, :status => status}]}  
      def items_to_stream(s)
        s.add_key "items"
        s.with_hash do
          object.keys.each do |role|
            s.add_key role.to_s
            s.with_array do
              object[role].each do |item|
                s.with_hash do
                  s.add_key "uuid"
                  s.add_value item.uuid.to_s
                  s.add_key "status"
                  s.add_value item.status
                end
              end
            end
          end
        end
      end

      def routing_key(for_action)
        MessageBus::generate_routing_key(
          :pipeline_uuid => 'pipeline',
          :user_uuid => @context.uuid_for(object.creator),  
          :model => @context.find_model_name(object.class),
          :action => for_action
        )
      end
    end
  end
end
