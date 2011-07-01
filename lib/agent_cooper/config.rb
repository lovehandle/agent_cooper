module AgentCooper
  class Config
    class << self
      def app_id=(app_id)
        @app_id = app_id
      end

      def app_id
        @app_id ||= nil
      end
    end
  end
end
