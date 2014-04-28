require 'multi_xml'
require 'httpclient'
require 'virtus'
require 'cgi'

require 'agent_cooper/config'
require 'agent_cooper/requests/finder'
require 'agent_cooper/requests/shopper'
require 'agent_cooper/requests/merchandiser'
require 'agent_cooper/response'
require 'agent_cooper/version'

module AgentCooper
  def self.configure(&block)
    Config.configure(&block)
  end
end
