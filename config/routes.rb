Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
                                    registrations: 'registrations' }

  root 'home#index'

  resources :books
  resources :billings, only: :update
  resources :shippings, only: :update
end
