require File.expand_path('../../../spec_helper', __FILE__)

describe FlowAccount::Client do
  before do
    @client = FlowAccount::Client.new(client_id: 'CID', client_secret: 'CS', access_token: 'AT')
  end

  describe ".tax_invoices" do
    before do
      stub_get('tax-invoices').
         with(query: {offset: 0, limit: 10}, headers: {'Authorization'=>'Bearer AT'}).
         to_return(status: 200, body: fixture('tax_invoices.json'), headers: {})
    end

    it "should get the correct resource" do
      @client.tax_invoices
      expect(
        a_get('tax-invoices').
          with(query: {offset: 0, limit: 10})
        ).to have_been_made
    end

    it "should return an array of tax invoices" do
      tax_invoices = @client.tax_invoices
      expect(tax_invoices).to be_a(Array)
      expect(tax_invoices.first.documentSerial).to eql('INV000027')
    end

  end
end
