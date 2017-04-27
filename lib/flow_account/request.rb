module FlowAccount
  module Request

    def post(path, options={}, signature=false, raw=false, unformatted=false, no_response_wrapper=false, signed=false)
      request(:post, path, options, signature, raw, unformatted, no_response_wrapper, signed)
    end

    def get(path, options={}, signature=false, raw=false, unformatted=false, no_response_wrapper=false, signed=false)
      request(:get, path, options, signature, raw, unformatted, no_response_wrapper, signed)
    end

    def put(path, options={}, signature=false, raw=false, unformatted=false, no_response_wrapper=false, signed=false)
      request(:put, path, options, signature, raw, unformatted, no_response_wrapper, signed)
    end

    def delete(path, options={}, signature=false, raw=false, unformatted=false, no_response_wrapper=false, signed=false)
      request(:delete, path, options, signature, raw, unformatted, no_response_wrapper, signed)
    end

    private
    def request(method, path, options, signature=false, raw=false, unformatted=false, no_response_wrapper=false, signed=sign_request)
      response = connection(raw).send(method) do |request|
        path = formatted_path(path) unless unformatted

        if development
          path = "/dev" + path
        end

        # if signed

        case method
        when :get, :delete
          request.url(URI.encode(path), options)
        when :post, :put
          request.path = URI.encode(path)
          request.body = options unless options.empty?
        end
      end

      return response if raw
      return response.body if no_response_wrapper
      return response
    end

  end
end
