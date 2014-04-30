require 'rubygems'
require 'bundler/setup'
require 'digest/md5'
require 'agent_cooper'
require 'pry'

module AgentCooperMethods
  def ebay_app_id
    ENV['EBAY_APP_ID'] || "APP_ID"
  end

  def cassette_name
    # Remove token so VCR doesn't generate a new cassette with a different (or
    # mock) key
    params = @request.parameters.dup
    %w(SECURITY_APPNAME CONSUMER-ID APPID).each { |param| params.delete(param) }

    Digest::MD5.hexdigest(params.to_json)
  end

  def seek_in_hash(hsh, key)
    hsh.each.find do |k, v|
      return v if k == key
      seek_in_hash(v, key) if v.is_a?(Hash)
    end
  end
end

World(AgentCooperMethods)

Before do
  AgentCooper.configure do |config|
    config.app_id = ebay_app_id
  end
end
