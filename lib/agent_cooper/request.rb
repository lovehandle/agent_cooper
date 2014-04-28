module AgentCooper
  class Request

    include Virtus

    # config attributes
    attribute :app_id, String,
      :default  => Proc.new { AgentCooper::Config.app_id },
      :writer   => :protected

    # request attributes
    attribute :query_parameters, Hash,
      :default  => Proc.new { {} },
      :accessor => :protected

    attribute :default_parameters, Hash,
      :accessor => :protected

    attribute :host, String,
      :accessor => :protected

    attribute :path, String,
      :accessor => :protected

    # @api public
    def <<(parameters)
      unless parameters.is_a?(Hash)
        raise ArgumentError, "+parameters+ must be an instance of Hash"
      end

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

    protected

    # @api private
    def escape(value)
      CGI.escape("#{value}")
    end

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
