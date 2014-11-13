Rails.application.routes.draw do
 

  get 'reservations/new'

  get 'reservations/create'

  root 'home#index'
  resources :customers,only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :restaurants, only: [:show]
end
