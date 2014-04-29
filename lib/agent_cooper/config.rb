module AgentCooper
  class Config
    class << self
      attr_writer :app_id

      # @api public
      def configure(&block)
        yield self
      end

      def app_id
        @app_id || env_app_id
      end

      private

      def env_app_id
        ENV['EBAY_APP_ID']
      end
    end
  end
end
