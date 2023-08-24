Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]
  resources :friend_requests, only: [:create]

  root to: 'users#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
