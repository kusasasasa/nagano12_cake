class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    @orders=Order.all
    @order_details=OrderDetail.all
    @total_amount=0
  end
end
