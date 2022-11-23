class Public::CartItemsController < ApplicationController
  def index
    @cart_items=CartItem.all
    @items=Item.all
    @item=Item.ids
    @item_total=0
  
   
  end
  def create
  
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
      # 4. トップ画面へリダイレクト
    redirect_to public_cart_items_index_path
  end
  def update
    
  end
  
  def destroy
  end
  
  def destroy_all
  end
  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end
