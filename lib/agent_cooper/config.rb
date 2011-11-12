module AgentCooper
  class Config
    class << self
      attr_accessor :app_id

      # @api public
      def configure(&block)
        unless block_given?
          raise ArgumentError, "No block given"
        end

        yield self if block_given?
      end
    end
  end
end
