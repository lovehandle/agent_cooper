# Utilities
require 'agent_cooper/config'
require 'agent_cooper/response'
require 'agent_cooper/request'

require 'agent_cooper/nokogiri_decorator'

# Requests
require 'agent_cooper/requests/finder'
require 'agent_cooper/requests/shopper'
require 'agent_cooper/requests/merchandiser'

#Version
require "agent_cooper/version"

module AgentCooper
  class << self
    def configure(&block)
      Config.configure(&block)
    end
  end
end
