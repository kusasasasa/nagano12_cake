class Public::HomesController < ApplicationController
 
  def top
    @items=Item.all
    @items = @items.reverse
  end

  def about
  end
end
