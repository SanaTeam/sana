Rails.application.routes.draw do
  resources :messages
  resources :profiles
  resources :posts
  resources :organizations
  resources :users
  resources :sessions

  root "posts#index"
  post "/posts/new", to: "posts#create"
  get "/match", to: "posts#match"

  post "/sessions/new", to: "sessions#create"

end
