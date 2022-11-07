Rails.application.routes.draw do
  
  namespace :public do
    get 'cart_items/index'
  end
  namespace :public do
    get 'items/index'
    get 'items/show'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    
    get 'homes/top'
    get 'homes/about'
  end

 devise_for :customers, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
 
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, controllers: {
  sessions: "admin/sessions"
}
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 root 'public/homes#top'
end
