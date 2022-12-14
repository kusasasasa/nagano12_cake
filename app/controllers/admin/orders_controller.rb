class Admin::OrdersController < ApplicationController
    def show
        @order=Order.find(params[:id])
        @customers=Customer.all
        @customer_order=@order.customer_id
        @order_details=OrderDetail.all
        @items=Item.all
        @total=0
        
    def update
        @order_select=params[:order][:status]
    end
        
    end
end
