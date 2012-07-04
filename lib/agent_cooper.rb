require 'nokogiri'
require 'eggnog'
require 'httpclient'
require 'virtus'
require 'cgi'

module AgentCooper
  def self.configure(&block)
    Config.configure(&block)
  end
end

require 'agent_cooper/config'
require 'agent_cooper/response'

require 'agent_cooper/request'
require 'agent_cooper/requests/finder'
require 'agent_cooper/requests/shopper'
require 'agent_cooper/requests/merchandiser'
require "agent_cooper/version"
