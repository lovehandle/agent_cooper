require 'nokogiri'

module AgentCooper
  class Response

    def initialize(response)
      @response = response
    end

    def body
      response.body
    end

    def to_hash
      xml.to_hash
    end

    def code
      response.code
    end

    def valid?
      code == 200
    end

    def xml
      @xml ||= Nokogiri::XML(body)
    end

    protected

    attr_reader :response

  end
end
