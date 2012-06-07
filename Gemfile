source "http://rubygems.org"

# Specify your gem's dependencies in lims-api.gemspec
gemspec

# TODO: Move this into the gemspec once this gets released.  The github version is needed
# because it fixes some of the 'after' callback handling so that the request is correctly
# available.
gem 'sinatra', :git => 'git@github.com:sinatra/sinatra.git'

group :guard do
  gem "guard"
  gem "guard-rspec"
  gem "guard-bundler"
  gem "guard-yard"
  gem "growl"
end
