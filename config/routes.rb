Rails.application.routes.draw do
  root 'application#home'
  
  resources :users
  resources :attractions
  resources :rides
  # resources :sessions, path: :signin

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  # get '/signin', to: 'sessions#new'
  # post '/signin', to: 'sessions#create'
  # get 'users/index'
  # get 'users/show'
  # get 'users/new'
  # get 'users/create'
  # get 'users/edit'
  # get 'users/update'
  # get 'users/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
