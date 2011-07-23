# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "agent_cooper/version"

Gem::Specification.new do |s|
  s.name        = "agent_cooper"
  s.version     = AgentCooper::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ryan Closner"]
  s.email       = ["ryan.closner@gmail.com"]
  s.homepage    = "https://rubygems.org/gems/agent_cooper"
  s.summary     = %q{A Ruby wrapper to the eBay Web Services API}
  s.description = %q{A Ruby wrapper to the eBay Web Services API}

  s.rubyforge_project = "agent_cooper"

  {
    'httpclient'          => '~> 2.2',
    'nokogiri'            => '~> 1.4'
  }.each {|lib, version| s.add_runtime_dependency lib, version }


  {
    'cucumber'            => '~> 1.0',
    'em-http-request'     => '~> 1.0.0.beta.4',
    'em-synchrony'        => '~> 0.3.0.beta.1',
    'rake'                => '~> 0.9',
    'rspec'               => '~> 2.6',
    'vcr'                 => '~> 1.10',
    'webmock'             => '~> 1.6'
  }.each {|lib, version| s.add_development_dependency lib, version }

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
