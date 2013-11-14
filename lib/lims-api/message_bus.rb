require 'lims-core/persistence/message_bus'
require 'yaml'

module Lims
  module Api
    # Helper functions
    module MessageBus
      class << self
        # Initialize the message bus
        # @param [String] environment
        def create_message_bus(env)
          config_file = File.join('config','amqp.yml')
          config = YAML.load_file(config_file)[env.to_s] 
          raise  Lims::Core::Persistence::MessageBus::InvalidSettingsError, "No section '#{env}' not found in configuration file '#{config_file}'" unless config
          message_bus = Lims::Core::Persistence::MessageBus.new(config)
          message_bus.set_message_persistence(config["message_persistent"])
          message_bus
        end

        # Helper function to generate a routing key in the
        # right format. Each part of the routing key is 
        # separated with a point and each part contains only 
        # letters or numbers.
        # A routing key is build according to the following pattern:
        # pipeline_uuid.user_uuid.model.action
        # @example
        # 555223677777.66662244900.order.create
        # @param [Hash] arguments
        def generate_routing_key(args)
          routing_key = ""
          %w{pipeline_uuid user_uuid model action}.each do |key|
            raise ArgumentError, "#{key} is missing to generate the routing key" unless args.include?(key.to_sym)

            routing_key << args[key.to_sym].gsub(/[^a-zA-Z0-9]/, '').downcase
            routing_key << "." 
          end
          routing_key[0..routing_key.length-2]
        end
      end
    end
  end
end

