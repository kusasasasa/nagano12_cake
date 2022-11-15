class Public::ItemsController < ApplicationController
  def index
    @items=Item.all
    @genre_name=Genre.all
  end

  def show
    @item = Item.find(params[:id])  
  end
  
end
