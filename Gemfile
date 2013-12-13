# vim:ft=ruby:ts=2:et:sw=2:sts=2
source "http://rubygems.org"

# Specify your gem's dependencies in lims-api.gemspec
gemspec

# TODO: Move this into the gemspec once this gets released.  The github version is needed
# because it fixes some of the 'after' callback handling so that the request is correctly
# available.
gem 'sinatra', :git => 'http://github.com/sinatra/sinatra.git', :branch => '459369eb66224836f72e21bbece58c007f3422fa'
gem 'lims-core', '~>3.1', :git => 'http://github.com/sanger/lims-core.git' , :branch => 'development'
#gem 'lims-core', :path => '../lims-core'
#gem 'lims-exception-notifier-app', :path => '../lims-exception-notifier-app'
gem 'lims-exception-notifier-app', :git => 'http://github.com/sanger/lims-exception-notifier-app.git'

group :guard do
  gem "guard"
  gem "guard-rspec"
  gem "guard-bundler"
  gem "guard-yard"
  gem "growl"
end
group :debugging do
  gem 'debugger', :platforms => :mri
  gem 'debugger-completion', :platforms => :mri
  gem 'ruby-debug', :platforms => :jruby
end

group :development do
  gem 'sqlite3', :platforms => :mri
  gem 'mysql2', :platforms => :mri
  gem 'ruby-prof', :platforms => :mri
  gem 'jdbc-sqlite3', :platforms => :jruby
  gem 'jdbc-mysql', :platforms => :jruby
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

group :yard do
  gem 'yard', '= 0.7.3', :platforms => :mri
  gem 'yard-rspec', '0.1', :platforms => :mri
  gem 'yard-state_machine', :platforms => :mri
  gem 'redcarpet', :platforms => :mri
  gem 'ruby-graphviz', :platforms => :mri
end
