require File.expand_path('../../spec_helper', __FILE__)

describe FlowAccount::Client do
  it "should connect using the endpoint configuration" do
    client = FlowAccount::Client.new
    endpoint = URI.parse(client.endpoint)
    connection = client.send(:connection).build_url(nil).to_s
    expect(connection).to eql(endpoint.to_s)
  end
end
