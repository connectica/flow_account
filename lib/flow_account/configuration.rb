module FlowAccount
  module Configuration

    DEFAULT_ACCESS_TOKEN = nil
    DEFAULT_CLIENT_ID = nil
    DEFAULT_CLIENT_SECRET = nil
    DEFAULT_USER_AGENT = "Flow Account Ruby Gem #{FlowAccount::VERSION}".freeze
    DEFAULT_FORMAT = :json
    DEFAULT_LOUD_LOGGER = true # TODO: use nil for deploy

    # The adapter that will be used to connect if none is set
    #
    # @note The default faraday adapter is Net::HTTP.
    DEFAULT_ADAPTER = Faraday.default_adapter



    DEFAULT_ENDPOINT = 'https://qyedkbf6yd.execute-api.ap-southeast-1.amazonaws.com/dev/'.freeze

    VALID_OPTIONS_KEYS = [
      :access_token,
      :client_id,
      :client_secret,
      :user_agent,
      :format,
      :loud_logger,
      :adapter
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
      self.user_agent         = DEFAULT_USER_AGENT
      self.format             = DEFAULT_FORMAT
      self.loud_logger        = DEFAULT_LOUD_LOGGER
      self.adapter            = DEFAULT_ADAPTER
    end
  end
end
