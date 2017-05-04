require 'faraday'
require File.expand_path('../version', __FILE__)


module FlowAccount
  module Configuration

    DEFAULT_ACCESS_TOKEN = nil
    DEFAULT_CLIENT_ID = nil
    DEFAULT_CLIENT_SECRET = nil
    DEFAULT_SCOPE = 'flowaccount-api'
    DEFAULT_USER_AGENT = "Flow Account Ruby Gem #{FlowAccount::VERSION}".freeze
    DEFAULT_FORMAT = :json
    DEFAULT_LOUD_LOGGER = nil
    DEFAULT_DEVELOPMENT = nil
    DEFAULT_CONNECTION_OPTIONS = {}
    DEFAULT_REDIRECT_URI = nil

    # By default, don't wrap responses with meta data (i.e. pagination)
    DEFAULT_NO_RESPONSE_WRAPPER = false

    # The adapter that will be used to connect if none is set
    #
    # @note The default faraday adapter is Net::HTTP.
    DEFAULT_ADAPTER = Faraday.default_adapter



    DEFAULT_ENDPOINT = 'https://qyedkbf6yd.execute-api.ap-southeast-1.amazonaws.com/'.freeze
    # DEFAULT_ENDPOINT = 'http://localhost:3000/'.freeze

    VALID_OPTIONS_KEYS = [
      :access_token,
      :client_id,
      :client_secret,
      :scope,
      :endpoint,
      :user_agent,
      :connection_options,
      :format,
      :loud_logger,
      :adapter,
      :no_response_wrapper,
      :redirect_uri,
      :development
    ]

    attr_accessor *VALID_OPTIONS_KEYS

    def options
      VALID_OPTIONS_KEYS.inject({}) do |options, key|
        options.merge!(key => send(key))
      end
    end

    def configure
      yield self
    end

    def self.extended(base)
      base.reset
    end

    def reset
      self.access_token       = DEFAULT_ACCESS_TOKEN
      self.client_id          = DEFAULT_CLIENT_ID
      self.client_secret      = DEFAULT_CLIENT_SECRET
      self.redirect_uri       = DEFAULT_REDIRECT_URI
      self.scope              = DEFAULT_SCOPE
      self.user_agent         = DEFAULT_USER_AGENT
      self.format             = DEFAULT_FORMAT
      self.loud_logger        = DEFAULT_LOUD_LOGGER
      self.adapter            = DEFAULT_ADAPTER
      self.endpoint           = DEFAULT_ENDPOINT
      self.connection_options = DEFAULT_CONNECTION_OPTIONS
      self.development        = DEFAULT_DEVELOPMENT
      self.no_response_wrapper= DEFAULT_NO_RESPONSE_WRAPPER
    end
  end
end
