class Admin::ItemsController < ApplicationController
  def new
    @item=Item.new
    @genre_name=Genre.all
  end

  def index
    @items=Item.all
    @genre=Genre.all

  end

  def show
     @item = Item.find(params[:id])  
  end

  def edit
    @item = Item.find(params[:id]) 
    @genre_name=Genre.all
  end
  def create
    item = Item.new(item_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    item.save
    # 4. トップ画面へリダイレクト
    redirect_to admin_items_index_path
  end
  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to admin_items_index_path  
  end
  private
  # ストロングパラメータ
  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :is_active)
  end
end

