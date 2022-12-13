Rails.application.routes.draw do
  namespace :admin do
    get 'genres/index'
    get 'genres/:id/edit' => 'genres#edit'
    post 'genres/:id/edit'=> 'genres#edit'
    
    post 'genres'=>'genres#create'
    patch 'genres/:id'=>'genres#update', as: 'update_genre'
  end
  namespace :admin do
    resources :customers, only: [:index, :show, :edit]
    resources :orders, only: [:show]
    patch 'customer/:id'=>'customers#update', as: 'update_customer'
    get 'items/new'
    get 'items/index'
    get 'items/:id'=> 'items#show', as: 'items_show'
    get 'items/:id/edit/'=> 'items#edit', as: 'items_edit'
    post 'items'=>'items#create'
    patch 'items/:id'=>'items#update', as: 'update_item'
    get 'orders/:id'=> 'orders#show', as: 'show_order'
  
    
  end
  get 'customers/my_page' => 'public/customers#show'
  get 'customers/edit'=> 'public/customers#edit'
  patch 'customers'=>'public/customers#update'
  get 'unsubscribe'=> 'public/customers#unsubscribe'
  patch 'withdrow'=>'public/customers#withdrow'
  patch 'cart_items/:id'=>'public/cart_items#update', as: 'update_cart_items'
  post 'orders'=> 'public/orders#create'
  patch 'orders/:id'=> 'admin/orders#update', as: 'update_order'
  namespace :public do
   
    get 'orders'=> 'orders#index'
    get 'orders/new'=> 'orders#new'
    get 'orders/complete'=> 'orders#complete'
    get 'orders/:id'=> 'orders#show'
    post 'orders/confirm'=> 'orders#confirm'

    get 'cart_items/index'
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
    post '/addresses'=>'addresses#create',as: 'create_addresses'
    delete 'addresses/:id'=>'addresses#destroy', as: 'destroy_addresses'
    patch  'addresses/:id'=>'addresses#update', as: 'update_addresses'
    get 'items/index'
    get 'items/:id'=> 'items#show', as: 'items_show'
    post '/cart_items'=>'cart_items#create'
    delete 'cart_items/:id'=>'cart_items#destroy', as: 'destroy_cart_items'
    delete 'destroy_all'=>'cart_items#destroy_all'
 
    
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
 root 'admin/homes#top'
end
