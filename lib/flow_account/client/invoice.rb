module FlowAccount
  class Client
    module Invoice

      def create_invoice(params)
        post('billing-notes', params)
      end

      def invoice(id)
        get("billing-notes/#{id}")
      end

      def invoices(offset=0, limit=10)
        get("billing-notes", {offset: offset, limit: limit})
      end

      def invoice_link(id, lang=:en)
        get("billing-notes/#{id}/#{lang}/share-link")
      end

    end
  end
end
