require 'lims-api'
require 'lims-core'
require 'lims-core/persistence/sequel'
require 'logger'
module Lims
  module Api
    # Helper functions 
    module Sequel
      class << self
        def connect_db(env)
          config = YAML.load_file(File.join('config','database.yml'))
          ::Sequel.connect(config[env.to_s])
        end

        def create_store(env)
          db = connect_db(:development)
          db.sql_log_level = :debug
          db.logger = Logger.new($stdout)
          store = Core::Persistence::Sequel::Store.new(connect_db(:development))
        end
      end
    end
  end


end
