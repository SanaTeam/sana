Rails.application.routes.draw do
  default_url_options :host => "localhost:3000"
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :messages
  resources :replies
  resources :posts
  resources :organizations
  resources :users
  resources :sessions
  resources :matches
  resources :administrators
  resources :password_resets, only: [:new, :create, :edit, :update]


  root "welcome#index"
  get "/home", to: "welcome#index"
  get "/match", to: "posts#match"
  get "/users/:id/:section", to: "users#show", constraints: { section: /(home|match|activity|match|organizations)/ }
  get "posts/:query/search", to: "posts#index", as: "post_search"
  get '/auth/auth0/callback' => 'auth0#callback'
  get '/auth/failure' => 'auth0#failure'
  get 'password_resets/new'
  get 'password_resets/edit'

  post "/posts/new", to: "posts#create"
  post "/sessions/new", to: "sessions#create"
  post "/matches/:id", to: "messages#create"
  post "/posts/:id", to: "replies#create"
  post "/organizations/:id", to: "organizations#create"
  post "/matches/:id/accept", to: "matches#accept", as: "accept_match"
end
