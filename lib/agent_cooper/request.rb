require 'forwardable'
require 'httpclient'
require 'cgi'

module AgentCooper
  class Request

    extend Forwardable

    def_delegators :@config, :app_id

    ENCODING = 'XML'

    def initialize
      @config = Config
    end

    def adapter
      @adapter ||= HTTPClient.new
    end

    def get
      response = adapter.get(url)
      Response.new(response)
    end

    def url
      URI::HTTP.build(
        :host  => host,
        :path  => path,
        :query => query
      )
    end

    def query
      query = default_parameters.merge(parameters)

      query.collect {|k,v| "#{CGI.escape(k.to_s)}=#{CGI.escape(v.to_s)}"}.sort * '&'
    end

    def parameters
      @parameters ||= {}
    end

    def <<(hash)
      parameters.merge!(hash)
    end

    def reset!
      @parameters = {}
    end
  end
end
