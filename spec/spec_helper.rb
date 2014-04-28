require 'rspec'

require File.expand_path('../../lib/agent_cooper',       __FILE__)

Dir['./spec/support/**/*.rb'].sort.each { |f| require f }

RSpec.configure do |c|
  c.treat_symbols_as_metadata_keys_with_true_values = true
end
