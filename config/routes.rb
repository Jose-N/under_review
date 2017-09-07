Rails.application.routes.draw do
  root 'submissions#index'

  resources :submissions, only: [:index, :show, :new, :create] do
    resources :comments, only: [:create]
  end
end
