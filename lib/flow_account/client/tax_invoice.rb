module FlowAccount
  class Client
    module TaxInvoice


      def create(params)
        response = post('/tax-invoices', params, signature=true, unformatted=true)
        response
      end
    end
  end
end
