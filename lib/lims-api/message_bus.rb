require 'lims-api'
require 'lims-core'

module Lims
  module Api
    # Helper functions
    module MessageBus
      class << self
        def create_message_bus(env)
          config = YAML.load_file(File.join('config','amqp.yml'))[env.to_s] 
          message_bus = Lims::Core::Persistence::MessageBus.new(config)
          message_bus.connect
          message_bus.create_channel
          message_bus.topic(config["exchange"], :durable => config["durable"])
        end

        def generate_routing_key(args)
          routing_key = ""
          %w{study_uuid user_uuid model uuid action}.each do |key|
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

