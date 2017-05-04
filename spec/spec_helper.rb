begin
  require 'simplecov'
rescue LoadError
  # ignore
else
  SimpleCov.start do
    add_group 'FlowAccount', 'lib/flow_account'
    add_group 'Faraday Middleware', 'lib/faraday'
    add_group 'Specs', 'spec'
  end
end

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "flow_account"
require "rspec"
require "webmock/rspec"

RSpec.configure do |config|
  config.include WebMock::API
end

def a_delete(path)
  a_request(:delete, FlowAccount.endpoint + path)
end

def a_get(path)
  a_request(:get, FlowAccount.endpoint + path)
end

def a_post(path)
  a_request(:post, FlowAccount.endpoint + path)
end

def a_put(path)
  a_request(:put, FlowAccount.endpoint + path)
end

def stub_delete(path)
  stub_request(:delete, FlowAccount.endpoint + path)
end

def stub_get(path)
  stub_request(:get, FlowAccount.endpoint + path)
end

def stub_post(path)
  stub_request(:post, FlowAccount.endpoint + path)
end

def stub_put(path)
  stub_request(:put, FlowAccount.endpoint + path)
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end
