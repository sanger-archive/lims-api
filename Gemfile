# vim:ft=ruby:ts=2:et:sw=2:sts=2
source "http://rubygems.org"

# Specify your gem's dependencies in lims-api.gemspec
gemspec

# TODO: Move this into the gemspec once this gets released.  The github version is needed
# because it fixes some of the 'after' callback handling so that the request is correctly
# available.
gem 'sinatra', :git => 'git@github.com:sinatra/sinatra.git'
gem 'lims-core', '~> 0.3.3', :git => 'git@github.com:sanger/lims-core.git' , :branch => 'development'

group :guard do
  gem "guard"
  gem "guard-rspec"
  gem "guard-bundler"
  gem "guard-yard"
  gem "growl"
end

group :development do
  gem "ruby-debug19"
  gem 'linecache19', :git => 'git@github.com:mark-moseley/linecache.git' 
  gem 'ruby-debug-base19', :git => 'git@github.com:mark-moseley/ruby-debug.git'
  gem 'shotgun'
end
