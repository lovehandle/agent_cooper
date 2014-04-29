module AgentCooper
  class Request
    attr_reader :default_parameters, :host, :path

    # @api public
    def <<(parameters)
      query_parameters.merge!(parameters)
    end

    # @api public
    def get
      Parser.new(Excon.get(url.to_s, query: parameters))
    end

    # @api public
    def reset!
      self.query_parameters = {}
    end

    # @api public
    def parameters
      default_parameters.merge(query_parameters)
    end

    def app_id
      AgentCooper::Config.app_id
    end

    def query_parameters
      @query_parameters ||= {}
    end

    protected

    attr_writer :app_id, :default_parameters, :host, :path

    # @api private
    def url
      options = {
        :host  => host,
        :path  => path
      }

      URI::HTTP.build(options)
    end

  end
end
