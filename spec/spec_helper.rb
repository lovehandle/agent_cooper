require 'rubygems'
require 'bundler/setup'
require 'rspec'
require 'pry'

require File.expand_path('../../lib/agent_cooper',       __FILE__)
require File.expand_path('../support/shared/request.rb', __FILE__)

RSpec.configure do |c|
  c.treat_symbols_as_metadata_keys_with_true_values = true
  c.order = :random
end
