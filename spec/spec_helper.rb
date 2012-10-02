require 'lims-api'
require 'rack/test'
require 'hashdiff'

# setup test environment
set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false

def app
  Lims::Api::Server
end

def json_version
  "3"
end

module Helper
    # converts a structure or a json string to a structure.
    # Transforms as well key to string.
    # @param  [String, Hash, Array]
    # @retun [Hash<String,String>]
    def self.parse_json(arg)
      case arg
      when String then JSON.parse(arg)
      when Array, Hash then arg
      end.recurse{|h| h.rekey { |k| k.to_s } }
    end
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
end

RSpec::Matchers.define :io_stream do |content|
  match { |stream| content == stream.read }
end


Rspec::Matchers.define :match_json do |content|

  match { |to_match| Helper::parse_json(to_match) == Helper::parse_json(content) }

  failure_message_for_should do |actual|
    hactual = Helper::parse_json(actual)
    hcontent = Helper::parse_json(content)
    diff = hactual ? hactual.diff(hcontent) : hcontent
    "expected #{hcontent} to match #{hactual},\n diff: #{diff} "
  end
end

RSpec::Matchers.define :include_json do |content|
  match do |actual|
    # content is what we specified in the spec
    # it is what needs to be checked as included 
    hactual = Helper::parse_json(actual)
    hcontent = Helper::parse_json(content)

    hcontent.inject(true) do |r, (key, value)|
      r && (hactual[key] == value)
    end

  end

  failure_message_for_should do |actual|
    errors = []
    hactual = Helper::parse_json(actual)
    hcontent = Helper::parse_json(content)

    diffs = HashDiff.diff(hcontent, hactual)
    "expected #{hcontent} to match #{hactual},\n diff:\n#{
    diffs.map { |d| d.join(' ') }.join("\n")}"
  end
end
