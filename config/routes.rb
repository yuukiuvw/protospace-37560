Rails.application.routes.draw do
  devise_for :users
  root to: 'bikes#index'
  resources :bikes,only: [:new, :create, :show,:edit,:update,:destroy] do
  resources :comments, only: :create
  end
  resources :users, only: :show
end
