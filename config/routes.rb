Rails.application.routes.draw do
  get 'invitations/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show]
  resources :sessions
  resources :events, only: [:new, :create, :index, :show]
  resources :invitations, only: [:new, :create]
  root to: 'events#index'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
