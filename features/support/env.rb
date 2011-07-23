require 'rubygems'
require 'bundler/setup'
require 'digest/md5'
require 'agent_cooper'


module AgentCooperMethods
  def ebay
    @ebay ||= YAML::load_file(File.dirname(__FILE__) + "/../../spec/fixtures/ebay.yml")
  end

  def ebay_app_id
    ebay['app_id']
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
