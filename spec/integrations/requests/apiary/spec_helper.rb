require "integrations/requests/spec_helper"
# This file will be required by
# all file in this directory and subdirectory

Rspec.configure do |config|
  config.before(:each) do
    set_uuid_start(*(1..5).to_a)
  end
end
