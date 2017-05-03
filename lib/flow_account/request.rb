module FlowAccount
  module Request

    def post(path, options={}, raw=false, no_response_wrapper=no_response_wrapper())
      request(:post, path, options, signature, raw, unformatted, no_response_wrapper, signed)
    end

    def get(path, options={}, raw=false, no_response_wrapper=no_response_wrapper())
      request(:get, path, options, signature, raw, unformatted, no_response_wrapper, signed)
    end

    def put(path, options={}, raw=false, no_response_wrapper=no_response_wrapper())
      request(:put, path, options, signature, raw, unformatted, no_response_wrapper, signed)
    end

    def delete(path, options={}, raw=false, no_response_wrapper=no_response_wrapper())
      request(:delete, path, options, signature, raw, unformatted, no_response_wrapper, signed)
    end

    private
    def request(method, path, options, raw=false, no_response_wrapper=false)
      response = connection(raw).send(method) do |request|
        if development
          path = "/dev" + path
        end
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
      return Response.new(response)
    end

  end
end
