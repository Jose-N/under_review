Rails.application.routes.draw do
  root 'submissions#index'

  resources :submissions, only: [:index, :show, :new, :create]
end
