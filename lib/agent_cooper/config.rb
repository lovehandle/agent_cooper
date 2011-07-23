module AgentCooper
  class Config
    class << self
      attr_accessor :app_id

      def configure(&block)
        yield self
      end
    end
  end
end
