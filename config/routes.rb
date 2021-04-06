Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
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
  get "/users/:id/match", to: "users#show"

  post "/posts/new", to: "posts#create"
  post "/sessions/new", to: "sessions#create"
  post "/matches/:id", to: "messages#create"
  post "/posts/:id", to: "replies#create"
end
