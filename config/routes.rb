Rails.application.routes.draw do
  resources :messages
  resources :profiles
  resources :posts
  resources :organizations
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "posts#index"
end
