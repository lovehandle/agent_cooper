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

  s.add_runtime_dependency "multi_xml", "~> 0.5.5"
  s.add_runtime_dependency "httpclient", "~> 2.3.4"
  s.add_runtime_dependency "virtus", "~> 1.0.2"

  s.add_development_dependency "cucumber", "~> 1.3.14"
  s.add_development_dependency "rake", "~> 10.3.1"
  s.add_development_dependency "rspec", "~> 2.14.1"
  s.add_development_dependency "vcr", "~> 2.9.0"
  s.add_development_dependency "webmock", "~> 1.17.4"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
