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
  s.add_runtime_dependency "httpclient", "~> 2.3.3"
  s.add_runtime_dependency "nokogiri", "~> 1.5.6"
  s.add_runtime_dependency "virtus", "~> 0.5.4"

  s.add_development_dependency "cucumber", "~> 1.2.2"
  s.add_development_dependency "rake", "~> 0.9.2"
  s.add_development_dependency "rspec", "~> 2.7.0"
  s.add_development_dependency "vcr", "~> 1.11.3"
  s.add_development_dependency "webmock", "~> 1.7.7"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
