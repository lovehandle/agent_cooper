require 'vcr'

def ebay_app_id
  ENV['EBAY_APP_ID']
end


VCR.config do |c|
  c.cassette_library_dir     = File.dirname(__FILE__) + '/../../spec/fixtures/cassettes'
  c.default_cassette_options = {
    :record             => :none,
    :match_requests_on  => [:host] }
  c.stub_with :webmock
  c.filter_sensitive_data('APP_ID') { ebay_app_id }
end
