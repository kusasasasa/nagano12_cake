class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!, only: [:index]
  def index
   @cart_items=CartItem.all
   @items=Item.all
   @item_total=0

  
   
  end
  def create
   
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present? # 追加しようとしている商品がcartにあるかどうか?
        
        # 追加しようとしている商品が存在した場合は,存在するrecordのamountの値を追加する
        
        # 1. すでにcartに存在するitemの個数を定義する(既に存在するrecoredを取得->個数を引き出す)
        old_amount = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).amount
        
        # 2. 新しく追加しようとしている数の定義
        amount = params[:cart_item][:amount]
        
        # 3.　1,2をそれぞれ足して既存のcartのrecordを更新する
        # 更新をかけるrecordを定義
        cart_item=current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
        
        # 更新をかけよう(更新を掛けたい対象.update(カラム名: value))
        cart_item.update(amount: old_amount.to_i+amount.to_i)
        redirect_to public_cart_items_index_path
    else
        cart_item = CartItem.new(cart_item_params)
        
        cart_item.customer_id = current_customer.id
       
        cart_item.save!
          # 4. トップ画面へリダイレクト
        redirect_to public_cart_items_index_path
    end
  end
  
  def update
    @cart_item=CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
   
    redirect_to  public_cart_items_index_path 
  end
  
  def destroy
    @cart_item=CartItem.find(params[:id ] )
    @cart_item.destroy
    redirect_to  public_cart_items_index_path 
  end
  
  def destroy_all
    current_customer=current_customer
    @cart_item=CartItem.destroy_all
    redirect_to  public_cart_items_index_path 
  end
  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end
end
