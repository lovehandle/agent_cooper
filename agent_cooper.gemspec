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
    'httparty'          => '~> 0.7.7',
    'nokogiri'            => '~> 1.4.4'
  }.each {|lib, version| s.add_runtime_dependency lib, version }
  
  
  {
    'bundler'             => '~> 1.0.0',
    'addressable'         => '2.2.4',
    'cucumber'            => '~> 0.10.0',
    'rake'                => '~> 0.8.7',
    'relish'              => '~> 0.3.0.pre',
    'rspec'               => '~> 2.5.0',
    'vcr'                 => '~> 1.9.0',
    'webmock'             => '~> 1.6.0'
  }.each {|lib, version| s.add_development_dependency lib, version }
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
