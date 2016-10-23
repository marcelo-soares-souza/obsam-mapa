Rails.application.routes.draw do
  resources :dispositivos

  devise_for :users
  resources :users

  # Main Page Route
  get 'home/index'
  root to: "home#index"
end
