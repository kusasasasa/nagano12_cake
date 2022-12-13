class Admin::OrderDetailsController < ApplicationController
    def update
    end
    private
    def order_params
        params.require(:order_details).permit(:price, :making_status, :amount, :item_id, :order_id)
    end
end
