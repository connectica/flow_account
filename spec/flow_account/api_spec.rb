require File.expand_path('../../spec_helper', __FILE__)

describe FlowAccount::API do
  before do
    @keys = FlowAccount::Configuration::VALID_OPTIONS_KEYS
  end

  context "with module configuration" do
    before do
      FlowAccount.configure do |config|
        @keys.each do |key|
          config.send("#{key}=", key)
        end
      end
    end

    after do
      FlowAccount.reset
    end

    it "should inherit module configuration" do
      api = FlowAccount::API.new
      @keys.each do |key|
        expect(api.send(key)).to eql(key)
      end
    end
  end


end
