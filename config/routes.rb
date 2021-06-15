Rails.application.routes.draw do
  # devise_for :users, path: 'auth'
  # root to: 'tweets#index'
  # resources :tweets
  # root to:'creations#index'
  root to: 'creations#index'
  resources :creations, only: :index
end