class Admin::OrdersController < ApplicationController
    def show
        @order=Order.find(params[:id])
        @customers=Customer.all
        @customer_order=@order.customer_id
        @order_details=OrderDetail.all
        @items=Item.all
        @total=0
        @order_detail=@order.order_details
    end
        
    def update
        order = Order.find(params[:id])
        order.update(order_params)
    
      
        redirect_to admin_order_path
    end
        

    private
    def order_params
        params.require(:order).permit(:customer_id, :address, :payment_method, :postage, :postal_code, :total_payment, :status, :name)
    end
end
