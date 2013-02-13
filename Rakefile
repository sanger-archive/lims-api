require "bundler/gem_tasks"

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |task|
  task.rspec_opts = '--color'
end

namespace :db do
  task :test do
    require 'sequel'
    require 'sequel/extensions/migration'
    spec = Gem::Specification.find_by_name('lims-core')
    core_migrations_path = "#{spec.gem_dir}/db/migrations"
    Sequel::Migrator.apply(Sequel.sqlite('test.db'), core_migrations_path)
  end
end

task :default => [ 'db:test', :spec ]
task :migrate_test => [ 'db:test' ]

require 'yard'
require 'yard/rake/yardoc_task'
YARD::Rake::YardocTask.new(:doc)
