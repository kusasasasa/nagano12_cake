class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!, only: [:index]
  def index
   @cart_items=CartItem.all
   @items=Item.all
   @item_total=0

  
   
  end
  def create
  
    cart_item = CartItem.new(cart_item_params)
  
    if current_customer.cart_items.find_by(item_id: cart_item.item_id)
        
        cart_item.save
        redirect_to public_cart_items_index_path
    else
        
        cart_item.customer_id = current_customer.id
       
        cart_item.save
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
