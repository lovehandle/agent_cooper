require 'multi_xml'
require 'excon'
require 'virtus'

module AgentCooper

  def self.configure(&block)
    yield Config if block_given?
  end

end

require 'agent_cooper/config'
require 'agent_cooper/response'

require 'agent_cooper/request'
require 'agent_cooper/requests/finder'
require 'agent_cooper/requests/shopper'
require 'agent_cooper/requests/merchandiser'
require "agent_cooper/version"
