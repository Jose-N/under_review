Rails.application.routes.draw do
  root 'submissions#index'

  devise_for :users
  resources :submissions, only: [:index, :show, :new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
