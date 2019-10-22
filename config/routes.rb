Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
                                    registrations: 'registrations' }

  root 'home#index'

  resources :books
  resource :user, only: %i[update edit destroy]
  resolve('User') { [:user] }
end
