Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root 'home#index'

  resources :books

  get 'users/settings', to: 'users#settings', as: 'settings'
  post 'users/settings/update_billing', to: 'users#update_billing', as: 'update_billing'
  post 'users/settings/update_shipping', to: 'users#update_shipping', as: 'update_shipping'
end
