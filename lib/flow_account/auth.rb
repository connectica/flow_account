module FlowAccount
  module Auth
    def get_access_token(options={})
      options[:grant_type] ||= "client_credentials"
      options[:scope] ||= scope if !scope.nil? && !scope.empty?

      params = access_token_params.merge(options)
      post("/token", params, signature=false, raw=false, unformatted=true, no_response_wrapper=true)
    end

    private
    def access_token_params
      {
        client_id: client_id,
        client_secret: client_secret
      }
    end

  end
end
