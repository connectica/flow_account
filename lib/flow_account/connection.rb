module FlowAccount
  module Connection

    private
    def connection(raw=false)
      options = {
        headers: { 'Accept' => "application/#{format}; charset=utf-8", 'User-Agent' => user_agent},
        url: endpoint
      }.merge(connection_options)

      Faraday::Connection.new(options) do |connection|
        connection.use FaradayMiddleware::LoudLogger if loud_logger
        
        connection.adapter(adapter)
      end
    end
  end
end
