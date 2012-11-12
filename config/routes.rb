Datildave::Application.routes.draw do
  get "sessions/create"

  get "sessions/destroy"

  get "users/new"

  get "users/create"

  get "home/index"
  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"

  resources :sessions
  resources :users

  root :to => 'home#index'

end
