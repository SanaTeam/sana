Rails.application.routes.draw do
  resources :messages
  resources :replies
  resources :profiles
  resources :posts
  resources :organizations
  resources :users
  resources :sessions
  resources :matches

  root "welcome#index"
  get "/home", to: "welcome#index"
  get "/match", to: "posts#match"

  post "/posts/new", to: "posts#create"
  post "/sessions/new", to: "sessions#create"
  post "/matches/:id", to: "matches#create"
end
