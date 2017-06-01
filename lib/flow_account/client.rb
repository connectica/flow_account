module FlowAccount
  class Client < API
    Dir[File.expand_path('../client/*.rb', __FILE__)].each{|f| require f}

    include FlowAccount::Client::TaxInvoice
    include FlowAccount::Client::Invoice
    include FlowAccount::Client::PurchaseOrder
  end
end
