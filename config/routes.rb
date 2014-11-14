Rails.application.routes.draw do
 

  root 'home#index'

  resources :customers,only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :restaurants, only: [:show]
  resources :reservations
end
