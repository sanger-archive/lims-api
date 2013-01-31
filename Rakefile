require "bundler/gem_tasks"

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |task|
  task.rspec_opts = '--color'
end

namespace :db do
  task :test do
    require 'sequel'
    require 'sequel/extensions/migration'
    Sequel::Migrator.apply(Sequel.sqlite('test.db'), "db/migrations")
  end
end

task :default => [ 'db:test', :spec ]

require 'yard'
require 'yard/rake/yardoc_task'
YARD::Rake::YardocTask.new(:doc)
