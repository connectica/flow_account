require "spec_helper"

describe FlowAccount do
  after do
    FlowAccount.reset
  end

  it "has a version number" do
    expect(FlowAccount::VERSION).not_to be(nil)
  end

  describe ".client" do
    it "should be a FlowAccount::Client" do
      expect(FlowAccount.client).to be_a(FlowAccount::Client)
    end
  end

  describe ".adapter" do
    it "should return the default adapter" do
      expect(FlowAccount.adapter).to eql(FlowAccount::Configuration::DEFAULT_ADAPTER)
    end
  end

  describe ".adapter=" do
    it "should set the adapter" do
      FlowAccount.adapter = :typhoeus
      expect(FlowAccount.adapter).to eql(:typhoeus)
    end
  end

  describe ".endpoint" do
    it "should return the default endpoint" do
      expect(FlowAccount.endpoint).to eql(FlowAccount::Configuration::DEFAULT_ENDPOINT)
    end
  end

  describe ".endpoint=" do
    it "should set the endpoint" do
      FlowAccount.endpoint = 'http://tumblr.com'
      expect(FlowAccount.endpoint).to eql('http://tumblr.com')
    end
  end

  describe ".user_agent" do
    it "should return the default user agent" do
      expect(FlowAccount.user_agent).to be(FlowAccount::Configuration::DEFAULT_USER_AGENT)
    end
  end

  describe ".user_agent=" do
    it "should set the user_agent" do
      FlowAccount.user_agent = 'Custom User Agent'
      expect(FlowAccount.user_agent).to eql('Custom User Agent')
    end
  end

  describe ".loud_logger" do
    it "should return the loud_logger status" do
      expect(FlowAccount.loud_logger).to eql(nil)
    end
  end

  describe ".loud_logger=" do
    it "should set the loud_logger" do
      FlowAccount.loud_logger = true
      expect(FlowAccount.loud_logger).to eql(true)
    end
  end

  describe ".configure" do

    FlowAccount::Configuration::VALID_OPTIONS_KEYS.each do |key|

      it "should set the #{key}" do
        FlowAccount.configure do |config|
          config.send("#{key}=", key)
          expect(FlowAccount.send(key)).to eql(key)
        end
      end
    end
  end

end
