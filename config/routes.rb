Rails.application.routes.draw do
  get "contacts/new"

  get "users/index"

  get "book/show"
  root "static_home#index"
  resources :books
  resources :users

end
