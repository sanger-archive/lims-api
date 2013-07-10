# vim:ft=ruby:ts=2:et:sw=2:sts=2
source "http://rubygems.org"

# Specify your gem's dependencies in lims-api.gemspec
gemspec

# TODO: Move this into the gemspec once this gets released.  The github version is needed
# because it fixes some of the 'after' callback handling so that the request is correctly
# available.
gem 'sinatra', :git => 'http://github.com/sinatra/sinatra.git', :branch => '459369eb66224836f72e21bbece58c007f3422fa'
gem 'lims-core', '~>2.3', :git => 'http://github.com/sanger/lims-core.git' , :branch => 'development'
#gem 'lims-core', :path => '../lims-core'

group :guard do
  gem "guard"
  gem "guard-rspec"
  gem "guard-bundler"
  gem "guard-yard"
  gem "growl"
end

group :debugger do
  gem 'debugger', :platforms => :mri
  gem 'debugger-completion', :platforms => :mri
  gem 'shotgun', :platforms => :mri
end

group :pry do
  gem 'debugger-pry', :require => 'debugger/pry', :platforms => :mri
  gem 'pry', :platforms => :mri
end

group :deployment do
  gem "psd_logger", :git => "http://github.com/sanger/psd_logger.git"
  gem 'trinidad', :platforms => :jruby
  gem "trinidad_daemon_extension", :platforms => :jruby
  gem 'activesupport', '~> 3.0.0', :platforms => :jruby
  gem 'jdbc-mysql', :platforms => :jruby
end

