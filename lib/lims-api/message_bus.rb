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
      end
    end
  end
end

