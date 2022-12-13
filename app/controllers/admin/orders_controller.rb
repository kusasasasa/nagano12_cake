class Admin::OrdersController < ApplicationController
    def show
        @order=Order.find(params[:id])
        @address_name=params[:address][:name]
    end
end
