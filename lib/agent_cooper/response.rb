module AgentCooper
  class Response

    def initialize(attributes)
      @response = attributes.fetch(:response)
    end

    # @api public
    def body
      response.body
    end

    # @api public
    def code
      response.code
    end

    # @api public
    def to_hash
      MultiXml.parse(body)
    end

    # @api public
    def valid?
      code == 200
    end

    # @api public
    def xml
      @xml ||= Nokogiri::XML(body)
    end

    protected

    attr_reader :response

  end
end
