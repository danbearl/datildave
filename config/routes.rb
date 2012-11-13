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


  resources :pages, only: [:new, :create]

  #keep these at the bottom of your file. They should be the last routes.
  get "/:slug", to: "pages#show", as: :slug
  get "/:slug/edit", to: "pages#edit", as: :edit_slug
  put "/:slug", to: "pages#update", as: :slug
  post "/:slug", to: "pages#destroy", as: :slug
end
