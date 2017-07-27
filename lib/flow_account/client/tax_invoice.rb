module FlowAccount
  class Client
    module TaxInvoice

      def create_tax_invoice(params)
        post('tax-invoices', params)
      end

      def update_tax_invoice(id, params)
        put("tax-invoices/#{id}", params)
      end

      def tax_invoice(id)
        get("tax-invoices/#{id}")
      end

      def tax_invoices(offset=0, limit=10)
        get("tax-invoices", {offset: offset, limit: limit})
      end

      def tax_invoice_link(id, lang=:en)
        get("tax-invoices/#{id}/#{lang}/share-link")
      end

    end
  end
end
