Datildave::Application.routes.draw do
  get "products/new"

  get "products/edit"

  get "products/delete"

  get "sessions/create"

  get "sessions/destroy"

  get "users/new"

  get "users/create"

  get "home/index"
  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"

  resources :sessions
  resources :users
  resources :products

  root :to => 'home#index'

end
