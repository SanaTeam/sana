Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :messages
  resources :replies
  resources :posts
  resources :organizations
  resources :users
  resources :sessions
  resources :matches

  root "welcome#index"
  get "/home", to: "welcome#index"
  get "/match", to: "posts#match"
  get "/users/:id/match", to: "users#show", as: "user_match"
  get "/users/:id/activity", to: "users#show", as: "user_activity"
  get "/users/:id/message", to: "users#show", as: "user_message"
  get "posts/:query/search", to: "posts#index", as: "post_search"
  

  post "/posts/new", to: "posts#create"
  post "/sessions/new", to: "sessions#create"
  post "/matches/:id", to: "messages#create"
  post "/posts/:id", to: "replies#create"
  post "/matches/:id/accept", to: "matches#accept", as: "accept_match"
end
