require 'lims-api'
require 'rack/test'

# setup test environment
set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false

def app
  Lims::Api::Server
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
end

RSpec::Matchers.define :io_stream do |content|
  match { |stream| content == stream.read }
end
