module FlowAccount
  module Request

    def get()

    end

    private
    def request(method, path, options, signature=false, raw=false, unformatted=false, no_response_wrapper=false, sogned=sign_request)
      response = connection(raw).send(method) do |request|
      end
    end
  end
end
