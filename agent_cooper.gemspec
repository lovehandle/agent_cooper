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

  runtime_dependencies = {
    "httpclient" => "~> 2.2.3",
    "nokogiri"   => "~> 1.5.5",
    "virtus"     => "~> 0.5.1"
  }

  runtime_dependencies.each {|lib, version| s.add_runtime_dependency(lib, version) }

  development_dependencies = {
    "cucumber" => "~> 1.1.2",
    "rake"     => "~> 0.9.2",
    "rspec"    => "~> 2.7.0",
    "vcr"      => "~> 1.11.3",
    "webmock"  => "~> 1.7.7"
  }

  development_dependencies.each {|lib, version| s.add_development_dependency(lib, version) }

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
