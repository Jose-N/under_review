Rails.application.routes.draw do
  root 'submissions#index'

  devise_for :users

  resources :submissions do
    resources :comments, only: [:create]
  end

  resources :comments, only: [:edit, :update, :destroy, :show]
end
