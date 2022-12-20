class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!, except: [:top]
  def top
    @orders=Order.page(params[:page])
    @order_details=OrderDetail.all
    @total_amount=0
    @customers=Customer.all
  end
  
end
