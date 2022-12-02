Rails.application.routes.draw do
  root to: "users#index"

  resources :users, only: [:show] do
    resources :posts, only: [:new, :create, :index, :show] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end
end