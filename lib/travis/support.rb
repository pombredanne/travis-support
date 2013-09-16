require 'securerandom'
require 'core_ext/securerandom'

module Travis
  autoload :Amqp,            'travis/support/amqp'
  autoload :Assertions,      'travis/support/assertions'
  autoload :Async,           'travis/support/async'
  autoload :Chunkifier,      'travis/support/chunkifier'
  autoload :Database,        'travis/support/database'
  autoload :Exceptions,      'travis/support/exceptions'
  autoload :Helpers,         'travis/support/helpers'
  autoload :Instrumentation, 'travis/support/instrumentation'
  autoload :LogSubscriber,   'travis/support/log_subscriber'
  autoload :Logger,          'travis/support/logger'
  autoload :Logging,         'travis/support/logging'
  autoload :Memory,          'travis/support/memory'
  autoload :Metrics,         'travis/support/metrics'
  autoload :NewRelic,        'travis/support/new_relic'
  autoload :Retryable,       'travis/support/retryable'

  class << self
    def env
     ENV['ENV'] || ENV['RAILS_ENV'] || ENV['RACK_ENV'] || 'development'
    end

    def logger
      @logger ||= Logger.configure(Logger.new(STDOUT))
    end

    def logger=(logger)
      @logger = Logger.configure(logger)
    end

    def uuid=(uuid)
      Thread.current[:uuid] = uuid
    end

    def uuid
      Thread.current[:uuid] ||= SecureRandom.uuid
    end
  end
end
