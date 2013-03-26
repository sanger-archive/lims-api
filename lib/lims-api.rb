require "lims-api/version"
require 'logger'

module Lims
  module Api
    # if you would like to see more verbose logging set it to INFO/DEBUG level
    LOGGER_LEVEL = Logger::WARN

    require 'lims-api/server'
    require 'lims-api/context_service'
  end
end
