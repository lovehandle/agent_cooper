require 'httparty'

module AgentCooper
  class Request

    ENCODING = 'XML'

    include HTTParty
    format :xml

    attr_accessor :locale

    def options
      @options ||= {}
    end

    def <<(hash)
      options.merge!(hash)
    end

    def reset!
      @options = {}
    end

    def get
      r = self.class.get(path, :query => options.merge(credentials))
      Response.new(r)
    end
  end
end
