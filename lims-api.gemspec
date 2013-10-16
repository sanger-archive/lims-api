# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "lims-api/version"

Gem::Specification.new do |s|
  s.name        = "lims-api"
  s.version     = Lims::Api::VERSION
  s.authors     = ["Matthew Denner"]
  s.email       = ["md12@sanger.ac.uk"]
  s.homepage    = "http://sanger.ac.uk/"
  s.summary     = %q{API for the new LIMS}
  s.description = %q{Provides the server side of the API for the new LIMS}

  s.rubyforge_project = "lims-api"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # TODO: s.add_dependency('sinatra', '~> 1.3.2') # But need latest from github so in Gemfile!
  # TODO: s.add_dependency('lims-core')  Gemfile because on github
  s.add_dependency('sequel')
  s.add_dependency('json')
  s.add_dependency('active_support') # inflectors only
  s.add_dependency('state_machine')

  s.add_development_dependency('rake', '~> 0.9.2')
  s.add_development_dependency('rspec', '~> 2.8.0')
  s.add_development_dependency('hashdiff')
  s.add_development_dependency('rack-test', '~> 0.6.1')
  s.add_development_dependency('github-markup', '~> 0.7.1')

  s.add_dependency('bunny', '0.9.0.pre10')
end
