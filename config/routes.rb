Rails.application.routes.draw do
  get 'addresses/index'
  devise_for :users
  root to: 'items#index'
  resources :items
  resources :addressse, only: [:index, :new]
end