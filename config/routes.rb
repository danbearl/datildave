Datildave::Application.routes.draw do
  
  post "product/add_to_cart" => "products#add_to_cart"
  post "cart/empty_cart" => "cart#empty_cart"
  post "order/payment" => "orders#payment"
  get "cart" => "cart#show", as: "cart"
  get "log_in" => "sessions#new", as: "log_in"
  get "log_out" => "sessions#destroy", as: "log_out"
  get "contact" => "contact#new", as: :new_contact
  post "contact" => "contact#create", as: :create_contact
  match 'heartbeat', to: proc { [200, {}, ''.chars] }, via: [:get, :post]
  root to: 'home#index'

  resources :sessions
  resources :users
  resources :products
  resources :pages, only: [:new, :create]
  resources :posts
  resources :orders
  resources :categories

  #keep these at the bottom of your file. They should be the last routes.
  get "/:slug", to: "pages#show", as: :slug
  get "/:slug/edit", to: "pages#edit", as: :edit_slug
  put "/:slug", to: "pages#update", as: :update_slug
  delete "/:slug", to: "pages#destroy", as: :destroy_slug

end
