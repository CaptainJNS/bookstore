Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root 'home#index'

  resources :books

  get 'users/settings', to: 'users#settings', as: 'settings'
  post 'users/settings/update_billing', to: 'users#update_billing', as: 'update_billing'
  post 'users/settings/update_shipping', to: 'users#update_shipping', as: 'update_shipping'
  post 'users/settings/update_email', to: 'users#update_email', as: 'update_email'
  post 'users/settings/update_password', to: 'users#update_password', as: 'update_password'
  post 'users/settings/destroy_account', to: 'users#destroy_account', as: 'destroy_account'
end
