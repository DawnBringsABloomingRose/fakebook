Rails.application.routes.draw do
  resources :friendships, only: [:create]
  get 'home' => 'home#index'
  resources :posts do
    resources :comments
    resources :likes, only: [:create, :destroy]
  end
  devise_for :users
  resources :users, only: [:index, :show]
  resources :friend_requests, only: [:create]

  root to: 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
