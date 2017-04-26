module FlowAccount
  module Configuration

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
  end
end
