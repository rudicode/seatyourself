Rails.application.routes.draw do

  root 'home#index'
  resources :customers, routes: [:new, :create]
  resources :sessions, routes: [:new, :create, :destroy]
  
end
