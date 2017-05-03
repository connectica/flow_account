module FlowAccount
  class Client
    module TaxInvoice

      def create_tax_invoice(params)
        post('/tax-invoices', params, signature=true, raw=false, unformatted=true)
      end

      def tax_invoice(id)
        get("/tax-invoices/#{id}", {}, signature=true, raw=false, unformatted=true)
      end

      def tax_invoices(offset=0, limit=10)
        get("/tax-invoices", {offset: offset, limit: limit}, signature=true, raw=false, unformatted=true)
      end

      def tax_invoice_link(id, lang=:en)
        get("/tax-invoices/#{id}/#{lang}/share-link", {}, signature=true, raw=false, unformatted=true)
      end

    end
  end
end
