module FlowAccount
  module Configuration

    DEFAULT_ACCESS_TOKEN = nil
    DEFAULT_CLIENT_ID = nil
    DEFAULT_CLIENT_SECRET = nil

    DEFAULT_ENDPOINT = 'https://qyedkbf6yd.execute-api.ap-southeast-1.amazonaws.com/dev/'.freeze

    VALID_OPTIONS_KEYS = [
      :access_token,
      :client_id,
      :client_secret
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
      self.access_token = DEFAULT_ACCESS_TOKEN
      self.client_id = DEFAULT_CLIENT_ID
      self.client_secret = DEFAULT_CLIENT_SECRET
    end
  end
end
