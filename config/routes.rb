Rails.application.routes.draw do
  resources :replies
  resources :profiles
  resources :posts
  resources :organizations
  resources :users
  resources :sessions
  resources :matches

  root "posts#index"
  post "/posts/new", to: "posts#create"
  post "/sessions/new", to: "sessions#create"
  post "/matches/:id", to: "matches#create"
end
