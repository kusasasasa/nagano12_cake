Rails.application.routes.draw do
  namespace :admin do
    get 'items/new'
    get 'items/index'
    get 'items/show'
    get 'items/edit'
    post 'items'=>'items#create'
    
  end
   get 'customers/my_page/' => 'public/customers#show'
 
  
  namespace :public do
   
    get 'customers/edit'

    get 'cart_items/index'
  
    get 'items/index'
    get 'items/show'
 
    
    get 'homes/top'
    get 'homes/about'
  end
  namespace :admin do
    get 'homes/top'
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
