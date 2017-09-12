Rails.application.routes.draw do
  root 'submissions#index'

  devise_for :users
  get '/submissions', to:'static_pages#index'

  namespace :api do
    namespace :v1 do
      resources :submissions, only: [:index]
    end
  end

  resources :submissions, only: [:create, :new, :edit, :update, :destroy, :show] do
    resources :comments, only: [:create]
  end

  resources :comments, only: [:edit, :update, :destroy, :show]
end
