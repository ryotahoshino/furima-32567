Rails.application.routes.draw do
  get 'cards/new'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root to: 'items#index'
  resources :items do
    resources :records, only: [:index, :new, :create]
  end
  resources :users, only: [:show, :update]
  resources :cards, only: [:new, :create]
end