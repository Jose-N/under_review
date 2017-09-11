Rails.application.routes.draw do
  root 'submissions#index'

  devise_for :users

  resources :submissions, only: [:index, :show, :new, :create] do
    resources :comments, only: [:create]
    resources :ratings, only: [:create]
  end

  resources :submissions, only: [:edit, :update, :destroy]
  resources :ratings, only: [:edit, :update, :destroy]
  resources :comments, only: [:edit, :update, :destroy]
end
