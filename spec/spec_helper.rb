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


Rspec::Matchers.define :match_json do |content|
  def parse(arg)
    case arg
    when String then JSON.parse(arg)
    when Array, Hash then arg
    end.recurse{|h| h.rekey { |k| k.to_s } }
  end

  match { |to_match| parse(to_match) == parse(content) }

  failure_message_for_should do |actual|
    hactual = parse(actual)
    hcontent = parse(content)
    diff = hactual ? hactual.diff(hcontent) : hcontent
    "expected #{content} to match #{actual},\n diff: #{diff} "
  end

end
