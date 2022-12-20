class Public::OrdersController < ApplicationController
     
    def new
        #4行目newからallにしている
        @order=Order.new
        @address=Address.all
        @customer=current_customer
        
        
    end
    
    def index
        #orderとcart_itemの値を取得したい
       
      
        @customer=current_customer
        @orders=current_customer.orders.page(params[:page])
        @order_details=OrderDetail.all
        @items=Item.all
        
        
      
      
    end
    def show
        @order=Order.find(params[:id])
        @order_details=OrderDetail.all
        @order_price=0
        @items=Item.all
        @customers=Customer.all
        
    end
    def create
        #入力画面から来たものの処理
        #1.支払いを入力
        #2.お届け先を入力
        #3.上記1,2を確認画面へ送信
        @order=Order.new(order_params)
        @order.customer_id = current_customer.id
        @order.postage=800
        @order.save
        @cart_items=current_customer.cart_items
        @cart_items.each do |cart_item|
            order_detail=OrderDetail.new(order_id: @order.id)
            order_detail.price=cart_item.item.price
            order_detail.amount=cart_item.amount
            order_detail.item_id=cart_item.item_id
            order_detail.save
        end
        @cart_items.destroy_all
        redirect_to public_orders_complete_path
        #確定画面から来たものの処理
        #1.確認画面から送られた情報とカート内商品をもとに注文・注文詳細テーブルに格納
        #2.カート内の商品を全て削除
  
        
    end
    def complete
        
        
    end
    def confirm
        @order_select=params[:order][:select_address]
        @order=Order.new(order_params)
        @order.customer_id=current_customer.id
        @order.payment_method=params[:order][:payment_method]
        @total_payment=current_customer.cart_items.cart_items_total_price(current_customer.cart_items)
        @cart_items=current_customer.cart_items
        @order.postage=800
        if @order_select=="1"
            @order.address=current_customer.address
            @order.name=current_customer.full_name
            @order.postal_code=current_customer.postal_code
            render :confirm
        elsif @order_select=="2"
            #addressテーブルのaddress_id番目を吹き出したい
            @order_address=Address.find(params[:order][:address_id])
            @order.address=@order_address.address
            @order.name=@order_address.name
            @order.postal_code=@order_address.postal_code
            render :confirm
        else
            #orderのnewのviewで打ち込んだフォームの値を取得
            
            #現在ログイン中のユーザーのアドレステーブルを作成
            @address=current_customer.addresses.new
            #現在ログイン中のユーザーのアドレスのアドレスからむを作成
            @address.address=params[:order][:address]
            @address.name=params[:order][:name]
            @address.postal_code=params[:order][:postal_code]
            @address.customer_id=current_customer.id
            @address.save
            @order.address=@address.address
            @order.name=@address.name
            @order.postal_code=@address.postal_code
            render :confirm

        end
        #1.入力画面から送られた情報とカート内商品を出力
        #2.入力画面から送られた情報を再び注文機能へ送信
        
    end
    
    private
    def order_params
        params.require(:order).permit(:customer_id, :address, :payment_method, :postage, :postal_code, :total_payment, :status, :name)
    end

end
