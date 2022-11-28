class Public::OrdersController < ApplicationController
    def new
        @order=Order.new
        @order.address=current_customer.address
        @order.postage=current_customer.postal_code
    end
    def index
        @orders=Order.all
    end
    def show
        
    end
    def create
        order=Order.new(order_params)
        order.customer_id = current_customer.id
        order.save
      # 4. トップ画面へリダイレクト
    redirect_to public_cart_items_index_path
        
    end
    def compelte
        
    end
    def confirm
        
    end
    private
    def order_params
        params.require(:order).permit(:customer_id, :address, :payment_method, :postage, :postal_code, :total_payment, :status, :name)
    end

end
