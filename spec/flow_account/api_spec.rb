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

    context "with class configuration" do

      before do
        @configuration = {
          access_token: 'AT',
          adapter: :typhoeus,
          client_id: 'CID',
          client_secret: 'CS',
          endpoint: 'http://9gag.com',
          user_agent: 'Custom User Agent',
          loud_logger: true,
          scope: 'all-api',
          connection_options: { :ssl => { :verify => true } },
          format: :json,
          no_response_wrapper: true,
          development: true
        }
      end

      context "during initialization" do
        it "should override module configuration" do
          api = FlowAccount::API.new(@configuration)
          @keys.each do |key|
            expect(api.send(key)).to eql(@configuration[key])
          end
        end
      end

      context "after initialization" do
        let(:api) { FlowAccount::API.new }

        before do
          @configuration.each do |key, value|
            api.send("#{key}=", value)
          end
        end

        it "should override module configuration after initialization" do
          @keys.each do |key|
            expect(api.send(key)).to eql(@configuration[key])
          end
        end

        describe "#connection" do
          it "should use the connection_options" do
            expect(Faraday::Connection).to receive(:new)
            api.send(:connection)
          end
        end
      end
    end
  end

  describe "#config" do
    subject { FlowAccount::API.new }

    let(:config) do
      c = {}; @keys.each{ |key| c[key]=key }; c
    end

    it "returns a hash representing the configuration" do
      @keys.each do |key|
        subject.send("#{key}=", key)
      end
      expect(subject.config).to eql(config)
    end
  end

  describe ".authorize_url" do
    it "should generate an authorize URL with necessary params" do
      params = {client_id: 'CID', client_secret: 'CS'}
      client = FlowAccount::Client.new(params)

      url = client.authorize_url

      params2 = client.send(:authorization_params)
      url2 = client.send(:connection).build_url("/token", params2).to_s

      expect(url2).to eql(url)
    end

    it "should not include client secret in URL params" do
      params = {client_id: "CID", client_secret: "CS"}
      client = FlowAccount::Client.new(params)
      url = client.authorize_url
      expect(url).to_not include("client_secret")
    end

    describe "scope params" do
      it "should include the scope if there is one set" do
        params = { scope: "comments invoices" }
        client = FlowAccount::Client.new(params)
        url = client.authorize_url
        expect(url).to include("scope")
      end
    end
  end

  describe ".get_access_token" do
    describe "common functionality" do
      before do
        @client = FlowAccount::Client.new(client_id: 'CID', client_secret: "CS")
        @url = @client.send(:connection).build_url("/token").to_s

        stub_request(:post, @url).
         with(body: {client_id: "CID", client_secret: "CS", grant_type: "client_credentials", scope: "flowaccount-api"}).
         to_return(status: 200, body: fixture("access_token.json"), headers: {})
      end

      it "should get the correct resource" do
        @client.get_access_token
        expect(
          a_request(:post, @url).
            with(body: {client_id: "CID", client_secret: "CS", grant_type: "client_credentials", scope: "flowaccount-api"})
          ).to have_been_made
      end

      it "should return a hash with an access_token" do
        response = @client.get_access_token
        expect(response.access_token).to eql('at')
      end
    end
  end

end
