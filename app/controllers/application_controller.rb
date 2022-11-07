class ApplicationController < ActionController::Base
            protect_from_forgery with: :exception

                   
            before_action :configure_permitted_parameters, if: :devise_controller?

            
            
            def after_sign_in_path_for(resource)
                case resource
                  when Customer
                    public_homes_top_path
                  when Admin
                    admin_homes_top_path
                end
            end
            private

            def configure_permitted_parameters

              devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:telephone_number])
            end
end
