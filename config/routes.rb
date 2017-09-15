Rails.application.routes.draw do
  root 'submissions#index'

  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :submissions, only: [:index]
    end
  end

  resources :submissions, only: [:index, :create, :new, :edit, :update, :destroy, :show] do
    resources :comments, only: [:create]
  end

  resources :comments, only: [:edit, :update, :destroy, :show]

  resources :searches, only: [:index]
  get '/searches/results', to:'searches#result'
  get '/keywords/troll', to:'keywords#troll'
  get '/keywords/funny', to:'keywords#funny'
  get '/keywords/helpful', to:'keywords#helpful'
  get '/keywords/story', to:'keywords#story'





end
