class ApplicationController < ActionController::Base
            protect_from_forgery with: :exception

            # ログイン済ユーザーのみにアクセスを許可する
            before_action :authenticate_user!
          
            # deviseコントローラーにストロングパラメータを追加する          
            before_action :configure_permitted_parameters, if: :devise_controller?

            
            
            def after_sign_in_path_for(resource)
                case resource
                when Customer
                  public_homes_top_url
                when Admin
                  admin_homes_top_url
                end
            end
            protected

            def configure_permitted_parameters
              # デフォルトにないname/join_year/部署を追加しているので、それらを許可するよう記載している
              devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:join_year,:department_id])
            end
end
