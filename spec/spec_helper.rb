begin
  require 'simplecov'
rescue LoadError
  # ignore
else
  SimpleCov.start do
    add_group 'Instagram', 'lib/instagram'
    add_group 'Faraday Middleware', 'lib/faraday'
    add_group 'Specs', 'spec'
  end
end

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "flow_account"
