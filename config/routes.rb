Rails.application.routes.draw do
  resources :messages
  resources :profiles
  resources :posts
  resources :organizations
  resources :users

  root "posts#index"
  get "/match", to: "posts#match"
end
