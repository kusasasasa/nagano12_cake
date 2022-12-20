class Admin::OrderDetailsController < ApplicationController
    def update
        @order_detail = OrderDetail.find(params[:id])
        @order = @order_detail.order
        @order_details = @order.order_details
    
        is_updated = true
        if @order_detail.update(order_detail_params)
        
          if @order_detail.making_status == "making"
            @order.update(status: 2) 
          end
          # ②製作ステータスが「製作中」のときに、注文ステータスを「製作中」に更新する。
          # ここから下の内容は③の内容になります。
          # 紐付いている注文商品の製作ステータスが "すべて" [製作完了]になった際に注文ステータスを「発送準備中」に更新させたいので、
          @order_details.each do |order_detail|
         #　紐付いている注文商品の製作ステータスを一つ一つeach文で確認していきます。
            
            if order_detail.making_status != "making"
              is_updated = false 
            end
          end
        
         if is_updated
            @order.update(status: 3) 
         end
          # is_updatedがtrueの場合に、注文ステータスが「発送準備中」に更新されます。上記のif文でis_updatedがfalseになっている場合、更新されません。
        end
        redirect_to admin_order_path(@order_detail.order.id)
      
    
    end
    
    private
    def order_detail_params
        params.require(:order_detail).permit(:price, :making_status, :amount, :item_id, :order_id)
    end
end
