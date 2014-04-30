require 'vcr'

def ebay_app_id
  ENV['EBAY_APP_ID'] || "APP_ID"
end


VCR.configure do |c|
  c.cassette_library_dir = File.dirname(__FILE__) + '/cassettes'
  c.default_cassette_options = {
    :record             => :none,
    :match_requests_on  => [:host] }
  c.hook_into :excon
  c.before_record { |http| http.ignore! if http.response.status.code >= 400 }
  c.filter_sensitive_data('APP_ID') { ebay_app_id }
end
