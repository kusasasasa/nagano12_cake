class Public::AddressesController < ApplicationController
    def index
        @address=Address.new
        @addresses=Address.all
    end
    
    def edit
         @address = Address.find(params[:id])
    end
    
    def create
        addresses=Address.new(addresses_params)
        addresses.customer_id = current_customer.id
        addresses.save
      # 4. トップ画面へリダイレクト
        redirect_to public_addresses_path
    end
    
    def destroy
        address = Address.find(params[:id])  # データ（レコード）を1件取得
        address.destroy  # データ（レコード）を削除
        redirect_to public_addresses_path  # 投稿一覧画面へリダイレクト  
    end
    
    def update
        address = Address.find(params[:id])
        address.update(addresses_params)
        redirect_to  public_addresses_path
    end
    private
  # ストロングパラメータ
  
    def addresses_params
        params.require(:address).permit(:customer_id, :name, :postal_code, :address)
    end
end
