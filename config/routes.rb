Rails.application.routes.draw do
<<<<<<< HEAD

  devise_for :users
  resources :submissions, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
=======
  root 'submissions#index'

  resources :submissions, only: [:index, :show, :new, :create]
>>>>>>> master
end
