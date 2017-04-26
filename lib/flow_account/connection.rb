module FlowAccount
  module Connection

    private
    def connection(raw=false)
      options = {
        headers: { 'Accept' => 'application/json; charset=utf-8', 'User-Agent' => user_agent},
        url: endpoint
      }
    end
  end
end
