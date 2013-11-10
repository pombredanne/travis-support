require 'hot_bunnies'

module Travis
  module Amqp
    require 'travis/support/amqp/hot_bunnies/consumer'
    require 'travis/support/amqp/hot_bunnies/publisher'

    class << self
      def config
        @config ||= {}
      end

      def config=(config)
        @config = config
      end

      def connected?
        !!@connection
      end

      def connection
        @connection ||= HotBunnies.connect(config)
      end
      alias :connect :connection

      def disconnect
        if connection
          connection.close if connection.isOpen
          @connection = nil
        end
      end
    end
  end
end
