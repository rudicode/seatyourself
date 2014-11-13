Rails.application.routes.draw do

  
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  root 'home#index'
  resources :customers, routes: [:new, :create]
  resources :sessions, routes: [:new, :create, :destroy]
  
end
