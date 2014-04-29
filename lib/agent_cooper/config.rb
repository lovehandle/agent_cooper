module AgentCooper
  class Config
    class << self
      attr_accessor :app_id

      # @api public
      def configure(&block)
        yield self
      end
    end
  end
end
