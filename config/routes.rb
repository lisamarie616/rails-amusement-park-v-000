Rails.application.routes.draw do

  resources :attractions
  resources :users, only: [:new, :create, :show]
  get 'signup' => 'users#new'
  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  get 'signout' => 'sessions#destroy'

  post 'ride/:id' => 'attractions#ride', as: 'ride'

  root 'attractions#index'
end