Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index', to:'articles#index'
  resources :items, only: [:index, :new, :create]
  resources :articles
end