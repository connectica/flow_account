require 'faraday'
require 'json'

module FaradayMiddleware
  class FlowAccountOAuth2 < Faraday::Middleware
    def call(env)
      if env[:method] == :get or env[:method] == :delete
        if env[:url].query.nil?
          query = {}
        else
          query = Faraday::Utils.parse_query(env[:url].query)
        end

        if @access_token and not query["client_secret"]
          env[:request_headers] = env[:request_headers].merge("Authorization" => "Bearer #{@access_token}")
        end
      else # :POST, :PUT
        if @access_token and not env[:body] && JSON.parse(env[:body])["client_secret"]
          env[:body] = {} if env[:body].nil?
          env[:request_headers] = env[:request_headers].merge(
            "Authorization" => "Bearer " + @access_token,
            "Content-Type" => "application/json"
            )
        end
      end

      @app.call env
    end

    def initialize(app, client_id, access_token=nil)
      @app = app
      @client_id = client_id
      @access_token = access_token
    end
  end
end


# request.headers['Authorization'] = "Bearer " + access_token
# request.headers['Content-Type'] = "application/json"
