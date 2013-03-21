require 'lims-api'
require 'lims-core/persistence/sequel'
require 'logger'

module Lims
  module Api
    # Helper functions 
    module Sequel
      class << self
        def connect_db(env)
          loggers = []
          #loggers << Loggers.new($stdout)
          config = YAML.load_file(File.join('config','database.yml'))
          ::Sequel.connect(config[env.to_s], :loggers => loggers)
        end

        def create_store(env)
          store = Core::Persistence::Sequel::Store.new(connect_db(:development))
        end
      end
    end
  end
end
