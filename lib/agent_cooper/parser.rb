require 'forwardable'

module AgentCooper
  class Parser
    extend Forwardable

    attr_reader :response

    # @api public
    def_delegators :response, :status, :body

    def initialize(response)
      @response = response
    end

    # @api public
    def to_hash
      MultiXml.parse(body)
    end

    # @api public
    def valid?
      status == 200
    end

  end
end
