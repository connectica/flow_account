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


def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end
