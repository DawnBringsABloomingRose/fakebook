Rails.application.routes.draw do
  resources :friendships, only: [:create, :index, :destroy]
  get 'home' => 'home#index'
  get 'friends', to: 'friendships#all'
  get 'friendships/all', to: 'friendships#all'
  get 'friendships/recieved_requests', to: 'friendships#recieved_requests'
  get 'friendships/sent_requests', to: 'friendships#sent_requests'
  resources :posts do
    resources :comments
    resources :likes, only: [:create, :destroy]
  end
  devise_for :users
  resources :users, only: [:index, :show]
  resources :friend_requests, only: [:create, :destroy]

  root to: 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
