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
    Digest::MD5.hexdigest(@request.parameters.to_json)
  end
end

World(AgentCooperMethods)

Before do
  AgentCooper.configure do |config|
    config.app_id = ebay_app_id
  end
end
