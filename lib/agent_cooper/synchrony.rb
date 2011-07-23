require 'agent_cooper'
require 'em-synchrony'
require 'em-synchrony/em-http'

module AgentCooper

  class Request
    def adapter
      @adapter ||= EM::HttpRequest
    end

    def aget(&block)
      http = adapter.new(url).aget
      http.callback { block.call(Response.new(http)) }
      http.errback  { block.call(Response.new(http)) }
    end

    def get
      http = adapter.new(url).get
      Response.new(http)
    end
  end

  class Response
    def body
      response.response
    end

    def code
      response.response_header.status
    end
  end

end
