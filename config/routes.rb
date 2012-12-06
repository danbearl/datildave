Datildave::Application.routes.draw do
  
  get "posts/index"

  get "posts/new"

  get "posts/edit"

  post "product/add_to_cart" => "products#add_to_cart"
  post "cart/empty_cart" => "cart#empty_cart"
  get "cart" => "cart#show", :as => "cart"
  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"
  match "contact" => "contact#new", :as => "contact", :via => :get
  match "contact" => "contact#create", :as => "contact", :via => :post
  root :to => 'home#index'

  resources :sessions
  resources :users
  resources :products
  resources :contacts
  resources :pages, only: [:new, :create]
  resources :posts

  #keep these at the bottom of your file. They should be the last routes.
  get "/:slug", to: "pages#show", as: :slug
  get "/:slug/edit", to: "pages#edit", as: :edit_slug
  put "/:slug", to: "pages#update", as: :slug
  post "/:slug", to: "pages#destroy", as: :slug

end
