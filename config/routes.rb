Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  resources :posts do
    resources :likes, only: [:create, :destroy]
  end

  resources :friendships, only: [:create, :destroy]

  post "/friendships/:friend_id", to: "friendships#create", as: "create_friendship"
  root to: 'posts#index'
  
end