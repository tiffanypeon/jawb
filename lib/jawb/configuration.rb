module Jawb
  module Configuration
    extend self

    def configure
      yield self
    end

    DEFAULT_CONFIG_KEYS = [
      :api_key,
      :authorization,
      :endpoint,
      :format,
      :user_agent,
    ].freeze

    def config_keys
      DEFAULT_CONFIG_KEYS
    end

    DEFAULT_ENDPOINT    = 'http://yourapi.com'
    DEFAULT_USER_AGENT  = "JSON api wrapper base #{Jawb::VERSION}".freeze
    DEFAULT_FORMAT       = :json

    attr_accessor *config_keys

    # Make sure we have the default values set when we get 'extended'
    def self.extended(base)
      base.reset
    end

    def options
      Hash[ * config_keys.map { |key| [key, send(key)] }.flatten ]
    end

    def reset
      self.endpoint   = DEFAULT_ENDPOINT
      self.user_agent = DEFAULT_USER_AGENT
      self.format     = DEFAULT_FORMAT
    end
  end
end
