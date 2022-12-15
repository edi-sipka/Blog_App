Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"

  resources :users, only: [:show] do
    resources :posts, only: [:new, :create, :index, :show, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end
end