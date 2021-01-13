Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show]
  # get 'users/new', to: 'users#new'
  # get 'users/show' => 'users#show'
  # get 'users/create' => 'users#create'
end
