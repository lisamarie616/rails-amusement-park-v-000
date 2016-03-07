Rails.application.routes.draw do

  resources :attractions
  resources :users, only: [:new, :create, :show]
  resources :rides, only: [:create]
  get 'signup' => 'users#new'
  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  get 'signout' => 'sessions#destroy'

  root 'attractions#index'
end