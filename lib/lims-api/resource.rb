require 'lims-api/message_bus'
module Lims::Api
  # Mixin giving a Resource wrapper behavior
  # A resource has typically an underlying object or a class
  # and a set of Encoder/Decoder.
  module Resource
    def self.included(base)
      base.extend ResourceClassMethods
    end

    def initialize(context)
      @context=context
    end

    # @abstract
    # List of actions available for the given resource.
    # Will be displayed by the actions block.
    # @return  [Array<String>]
    def actions
      raise NotImplementedError, "#{self.class.name}#actions not implemented"
    end

    # Generate a routing key for the given resource
    # used to route the message on the bus.
    # @param [String] action name
    # @return [String] routing key
    def routing_key(for_action)
      model = defined?(self.model_name) ? self.model_name : self.name

      MessageBus::generate_routing_key(
        :pipeline_uuid => "pipeline",
        :user_uuid => "user",
        :model => model.to_s,
        :action => for_action
      )
    end

    # -----------------
    # Encoder 
    # -----------------

    def encoder_for(mime_types)
      find_encoder_class_for(mime_types).andtap { |m, k| k.new(self, m, @context) }
    end


    # find first encoder available in {EncoderClassMap}.
    # @param [Array<String>] mime_types
    # @return [Array<String, Class], nil] the selected mime_type and the class
    def find_encoder_class_for(mime_types)
      mime_types.each do |mime_type| 
        self.class.encoder_class_map[mime_type].andtap { |k| return [mime_type, k] }
      end
      nil
    end


    # Map of Encoder classes by mime_type
    # @return [Hash<String, Class>]
    module ResourceClassMethods
      def encoder_class_map
        raise NotImplementedError, "encoder_class_map"
      end
    end

    # -----------------
    # Decoder 
    # -----------------

    def decoder_for(mime_types)
      decoder_class_for(mime_types).andtap { |k| k.new(self) }
    end


    # find first decoder available in {DecoderClassMap}.
    # @param [String] mime_types
    # @return [Class, nil]
    def decoder_class_for(mime_type)
      self.class.decoder_class_map[mime_type].andtap { |k| return k }
      nil
    end


    # -----------------
    # Helpers
    # -----------------
    def hash_to_stream(s, hash, mime_type)
      s.with_hash do
        hash.each do |k,v|
          case v
          when nil # skip nill value
            next
          when Lims::Core::Resource
            s.add_key k
            resource = @context.resource_for(v,@context.find_model_name(v.class))
            s.with_hash do
              resource.encoder_for([mime_type]).to_hash_stream(s)
            end
            k = nil # to skip default  assignation to key
          end
          if k
            s.add_key k
            s.add_value v
          end
        end
      end
    end

    # Replace recursively key/value pairs corresponding to an uuid by the corresponding resource pair
    # @example
    # { :sample_uuid => '134'} => { :sample => SampleResource }
    # @param [Hash<String,Arrays>] a structure
    # @param [Lims::Core::Persistence::Session] session needed to load the object
    # @return [Hash<String,Arrays>
    def recursively_load_uuid(attributes, session)
      attributes.mashr do |k, v|
        case k
        when /(.*)_uuid\Z/
          [$1, session[v]]
        else
          [k,v]
        end
      end
    end

    # Map of Decoder classes by mime_type
    # @return [Hash<String, Class>]
    module ResourceClassMethods
      def decoder_class_map
        raise NotImplementedError, "decoder_class_map"
      end
    end

    module ResourceClassMethods
      # Helper to define action methods.
      # The Server is expecting the result of an action to be a Proc (lazzy evaluation?).
      # Most Actions needs to be executed within a session.
      # This helper wrap a block int both
      # @param [String] name of the method/action to define
      # @yield (session,*args) session to execute the action
      # @yieldparam [Lims::Core::Persistence::Session] session
      # @yieldparam [Array] additional arguments
      def create_action(name, &block)
        define_method(name) do |*args|
          lambda {
            @context.with_session do |session|
              instance_exec(session, *args, &block)
            end
          }
        end
      end
    end

    module Encoder
      def self.included(base)
        base.class_eval do
          attr_reader :object
        end
      end

      def initialize(object, mime_type,  context)
        @object = object      
        @mime_type = mime_type
        @context = context
      end

      def status
        200
      end

      # @abstract
      # @return [String]
      def content_type
        raise NotImplementedError, "Encoder::content_type"
      end

      def status
        200
      end

      # @abstract
      # encode the underlying object to string.
      # @return [String]
      def call()
        raise NotImplementedError, "Encoder::call"
      end

      # @abstract
      # Fill a stream of a representation of itself
      # @param [Stream] stream
      def to_stream(stream)
        raise NotImplementedError, "Encoder::to_stream"
      end

      # @abstract
      # Fill a HashStream  with the content of the resource
      # @param [HashStream] stream
      def to_hash_stream(stream)
        raise NotImplementedError, "Encoder::to_hash_stream"
      end

      # Encode the list of available actions to a stream
      # @param[Stream]
      def actions_to_stream(s)
        s.add_key :actions
        s.with_hash do
          object.actions.each do |a|
            s.add_key a
            s.add_value url_for_action(a)
          end
        end
      end


      def url_for(arg)
        @context.url_for(arg)
      end
    end

    module Decoder
      def self.included(base)
        base.class_eval do
          attr_reader :resource
        end
      end

      def initialize(resource)
        @resource = resource      
      end
    end
  end
end

# ==== Helper functions === 
class Hash
  def mashr(&block)
    mash do |k,v| 
      block[ k, v.respond_to?(:mashr) ? v.mashr(&block) : v ]
    end
  end
end

class Array
  def mashr(&block)
    map do |v| 
      block[ nil, v.respond_to?(:mashr) ? v.mashr(&block) : v ][1]
    end
  end
end
