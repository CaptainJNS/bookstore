Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
                                    registrations: 'registrations' }

  root 'home#index'

  resources :books
  # resources :users, only: %i[edit update]
  resources :users, only: :update
  get '/settings', to: 'users#edit', as: 'settings'
end
