module FlowAccount
  class Client
    module PurchaseOrder

      def create_purchase_order(params)
        response = post('/purchase-orders', params, signature=true, raw=false, unformatted=true)
        response
      end

    end
  end
end
