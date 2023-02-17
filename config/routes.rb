Rails.application.routes.draw do
  root 'top#index'

  devise_for :users, controllers: {
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    # confirmations: 'users/confirmations',
    # unlocks: 'users/unlocks',
    # omniauth_callbacks: 'users/omniauth_callbacks',
  }
  resources :users, only: [:show]
end
