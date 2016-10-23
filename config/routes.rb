Rails.application.routes.draw do
  resources :dispositivos
  resources :images
  # Users Routes
  devise_for :users
  resources :users

  # Main Page Route
  get 'home/index'
  root to: "home#index"
end
