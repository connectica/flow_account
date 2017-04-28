module FlowAccount
  class Client
    module TaxInvoice

      def create_tax_invoice(params)
        response = post('/tax-invoices', params, signature=true, raw=false, unformatted=true)
        response
      end

    end
  end
end
