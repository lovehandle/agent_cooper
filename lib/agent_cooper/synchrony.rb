require 'em-synchrony'
require 'em-synchrony/em-http'

module AgentCooper

  class Request

    # request attributes
    attribute :request_adapter, Object,
      :default  => Proc.new { EM::HttpRequest },
      :accessor => :protected

    # @api public
    def aget(&block)
      http = new_adapter.aget
      http.callback { block.call(Response.new(:response => http)) }
      http.errback  { block.call(Response.new(:respose  => http)) }
    end

    # @api public
    def get
      http = new_adapter.get
      Response.new(:response => http)
    end

    private

    # @api private
    def new_adapter
      request_adapter.new(url)
    end

  end

  class Response
    # @api public
    def body
      response.response
    end

    # @api public
    def code
      response.response_header.status
    end
  end

end
