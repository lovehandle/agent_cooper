module AgentCooper
  class Config

    # CLASS METHODS

    def self.app_id
      @app_id || default_app_id
    end

    def self.app_id=(value)
      @app_id = value
    end

    def self.configure(&block)
      warn "[DEPRECATED] `AgentCooper::Config.configure` is deprecated. Please use `AgentCooper.configure` instead"
      yield self if block_given?
    end

    def self.default_app_id
      ENV['EBAY_APP_ID'] or raise ArgumentError.new('Missing App ID')
    end

    private_class_method :default_app_id

  end
end
