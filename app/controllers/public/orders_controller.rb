class Public::OrdersController < ApplicationController
     
    def new
        #4行目newからallにしている
        @order=Order.new
        @orderes=current_customer
        
        
    end
    def index
        @orders=Order.all
    end
    def show
        
    end
    def create
        order=Order.new(order_params)
        
        enum payment_method: { credit_card: 0, transfer: 1 }
        order.customer_id = current_customer.id
        order.postage=800
        order.total_payment=current_customer.item_id.price
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
