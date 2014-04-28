# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "agent_cooper/version"

Gem::Specification.new do |s|
  s.name        = "agent_cooper"
  s.version     = AgentCooper::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ryan Closner"]
  s.email       = ["ryan@ryanclosner.com"]
  s.homepage    = "https://rubygems.org/gems/agent_cooper"
  s.summary     = %q{A Ruby wrapper to the eBay Web Services API}
  s.description = %q{A Ruby wrapper to the eBay Web Services API}

  s.rubyforge_project = "agent_cooper"

  s.add_runtime_dependency "multi_xml", "~> 0.5.3"
  s.add_runtime_dependency "virtus", "~> 0.5.4"
  s.add_runtime_dependency 'excon', '>= 0.22.1'

  s.add_development_dependency "cucumber"
  s.add_development_dependency "rake"
  s.add_development_dependency "pry"
  s.add_development_dependency "rspec"
  s.add_development_dependency "vcr"
  s.add_development_dependency "webmock"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
