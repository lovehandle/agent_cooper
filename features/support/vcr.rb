require 'vcr'

def ebay
  @ebay ||= YAML::load_file(File.dirname(__FILE__) + "/../../spec/fixtures/ebay.yml")
end

def ebay_app_id
  ebay['app_id']
end


VCR.config do |c|
  c.cassette_library_dir     = File.dirname(__FILE__) + '/../../spec/fixtures/cassettes'
  c.default_cassette_options = {
    :record             => :none,
    :match_requests_on  => [:host] }
  c.stub_with :webmock
  c.filter_sensitive_data('YOUR-APP-ID') { ebay_app_id }
end
