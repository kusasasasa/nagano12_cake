class Public::CustomersController < ApplicationController
  def show
    
    @customer=current_customer

    
  end

  def edit
    @customer=current_customer
  
  end
  def update
    
    customer=current_customer
    customer.update(account_update_params)
    redirect_to customers_my_page_path 
 
  end
  private
  # ストロングパラメータ
  
  def account_update_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :password)
  end
end



