Rails.application.routes.draw do
  get 'welcome/index'
  resources :messages
  resources :profiles
  resources :posts
  resources :organizations
  resources :users
  resources :sessions

  root "welcome#index"
  post "/posts/new", to: "posts#create"
  get "/match", to: "posts#match"

  post "/sessions/new", to: "sessions#create"
  get "/home", to: "welcome#index"

end
