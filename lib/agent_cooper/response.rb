module AgentCooper
  class Response

    def initialize(attributes)
      @response = attributes.fetch(:response)
    end

    def body
      response.body
    end

    def code
      response.status
    end

    def to_hash
      MultiXml.parse(body)
    end

    def valid?
      code == 200
    end

    protected

    attr_reader :response

  end
end
