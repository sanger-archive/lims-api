require 'lims-api'
require 'lims-core/persistence/sequel'
require 'logger'
require 'yaml'

module Lims
  module Api
    # Helper functions 
    module Sequel
      class << self
        def connect_db(env)
          loggers = []
          #loggers << Loggers.new($stdout)
          config_file = File.join('config','database.yml')
          config = YAML.load_file(File.join('config','database.yml'))[env.to_s]
          raise "Can't find section '#{env}' in file '#{config_file}'" unless config
          ::Sequel.connect(config, :loggers => loggers)
        end

        def create_store(env)
          Core::Persistence::Sequel::Store.new(connect_db(env))
        end
      end
    end
  end
end
