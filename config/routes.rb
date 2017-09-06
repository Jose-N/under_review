Rails.application.routes.draw do
  root 'submissions#index'

  resources :submissions, only: [:index, :new, :create]
end
