Rails.application.routes.draw do
  root 'top#index'

  get "dashboard", :to => "dashboard#index"

  devise_for :users, controllers: {
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    # confirmations: 'users/confirmations',
    # unlocks: 'users/unlocks',
    # omniauth_callbacks: 'users/omniauth_callbacks',
  }

  namespace :dashboard do
    resources :users, only: [:index, :show, :edit, :update, :destroy, :create]
    resources :reservations, only:[:index, :create ,:destroy]
  end

  resources :users, only: [:show]
  resources :reservations
end
