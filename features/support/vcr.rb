require 'vcr'

VCR.config do |c|
  c.cassette_library_dir = File.dirname(__FILE__) + '/cassettes'
  c.hook_into :webmock
  c.default_cassette_options = {
    :record             => :none,
    :match_requests_on  => [:host]
  }
  c.filter_sensitive_data('APP_ID', ENV['EBAY_APP_ID'] || 'APP_ID')
end
