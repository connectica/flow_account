module FlowAccount
  module Auth
    def get_access_token(options={})
      options[:grant_type] ||= "client_credentials"
      options[:scope] ||= scope if !scope.nil? && !scope.empty?

      params = access_token_params.merge(options)
      post("/token", params, raw=false, no_response_wrapper=true)
    end

    def authorize_url(options={})
      options[:scope] ||= scope if !scope.nil? && !scope.empty?

      params = authorization_params.merge(options)
      connection.build_url("/token", params).to_s
    end

    private
    def access_token_params
      {
        client_id: client_id,
        client_secret: client_secret
      }
    end

    def authorization_params
      {
        client_id: client_id,
        scope: scope
      }
    end
  end
end
