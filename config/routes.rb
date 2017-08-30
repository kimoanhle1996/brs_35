Rails.application.routes.draw do
  get "/login", to: "login#new"

  get "contacts/new"

  get "/signup", to: "users#new"

  get "book/show"

  root "static_home#index"

  delete "/logout", to: "login#destroy"

  post "/login",   to: "login#create"
  #resources :books
  resources :users
  #resources :login
  resources :account_activations, only: [:edit]

end
