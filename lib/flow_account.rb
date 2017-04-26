require "flow_account/version"

require "flow_account/configuration"
require "flow_account/api"
require "flow_account/client"

module FlowAccount
  extend Configuration

  def self.client(options={})
    FlowAccount::Client.new(options)
  end
end
