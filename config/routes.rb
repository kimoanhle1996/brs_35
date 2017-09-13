Rails.application.routes.draw do
  #get "password_resets/new"
  # get "password_resets/edit"
  get "/login", to: "login#new"
  get "contacts/new"
  get "/signup", to: "users#new"
  get "book/show"

  root "static_home#index"
  delete "/logout", to: "login#destroy"
  post "/login",   to: "login#create"
  resources :books
  resources :users
  #resources :login
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :catagories
  resources :searchs
  resources :comments
  resources :requests
  resources :ratings
  namespace :admin do
    resources :users
  end
end
