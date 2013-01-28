# vim:ft=ruby:ts=2:et:sw=2:sts=2
source "http://rubygems.org"

# Specify your gem's dependencies in lims-api.gemspec
gemspec

# TODO: Move this into the gemspec once this gets released.  The github version is needed
# because it fixes some of the 'after' callback handling so that the request is correctly
# available.
gem 'sinatra', :git => 'http://github.com/sinatra/sinatra.git'
gem 'lims-core', '~>1.0', :git => 'http://github.com/sanger/lims-core.git' , :branch => 'master'
#gem 'lims-core', '~>1.0', :git => 'http://github.com/sanger/lims-core.git' , :branch => 'development'
# gem 'lims-core', :path => '../lims-core'

group :guard do
  gem "guard"
  gem "guard-rspec"
  gem "guard-bundler"
  gem "guard-yard"
  gem "growl"
end

group :debugger do
  gem 'debugger'
  gem 'debugger-completion'
  gem 'shotgun'
end

group :pry do
  gem 'debugger-pry', :require => 'debugger/pry'
  gem 'pry'
end

group :deployment do
  gem "psd_logger", :git => "git@github.com:sanger/psd_logger.git"
  gem 'trinidad', :platforms => :jruby
  gem "trinidad_daemon_extension", :platforms => :jruby
end
