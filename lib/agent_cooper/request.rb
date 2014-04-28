module AgentCooper
  module Request

    # INCLUSIONS

    include Virtus.module

    # ATTRIBUTES

    attribute :request_adapter, Object, default: lambda {|*args| HTTPClient.new }
    attribute :parameters, Hash, default: {} 
    attribute :host, String, default: nil
    attribute :path, String, default: nil

    def query_parameters
      warn "[DEPRECATION] `query_parameters` is deprecated. Please use `parameters` instead."
      parameters
    end

    def query_parameters=(params)
      warn "[DEPRECATION] `query_parameters=` is deprecated. Please use `parameters=` instead."
      self.parameters = params
    end

    def default_parameters
      warn "[DEPRECATION] `default_parameters` is deprecated. Please use `defaults` instead."
      defaults
    end

    def default_parameters=(params)
      warn "[DEPRECATION] `default_parameters=` is deprecated. Please use `defaults=` instead."
      self.defaults = params
    end

    # INSTANCE METHODS

    def get
      Response.new(response: request_adapter.get(url))
    end

    def <<(params)
      if params.is_a?(Hash)
        parameters.merge!(params)
      else
        raise ArgumentError, "`params` must be an instance of Hash"
      end
    end

    def reset!
      self.parameters = {}
    end

    def defaults
      self.class::DEFAULTS.call
    end

    private :defaults

    def query
      defaults.merge(parameters).collect {|k,v| "#{ CGI.escape(k.to_s) }=#{ CGI.escape(v.to_s) }" }.sort * '&'
    end

    private :query

    def url
      URI::HTTP.build(host: host, path: path, query: query)
    end

    private :url

  end
end
