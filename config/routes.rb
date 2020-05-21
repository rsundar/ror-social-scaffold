Rails.application.routes.draw do

  root 'posts#index'

  devise_for :users

  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

  resources :friendships, only: [:create]
  patch 'accept', to: 'friendships#accept', as: :accept
  delete 'decline', to: 'friendships#decline', as: :decline
  delete 'cancel', to: 'friendships#cancel', as: :cancel
  delete 'delete', to: 'friendships#delete', as: :delete

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
