module FlowAccount
  class Client
    module PurchaseOrder

      def create_purchase_order(params)
        response = post('/purchase-orders', params)
        response
      end

    end
  end
end
