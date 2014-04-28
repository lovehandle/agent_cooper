module AgentCooper
  class Config
    class << self
      attr_accessor :app_id

      # @api public
      def configure(&block)
        if block_given?
          yield self
        else
          raise ArgumentError, 'No block given'
        end
      end
    end
  end
end
