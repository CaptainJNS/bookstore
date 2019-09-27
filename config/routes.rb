Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root 'home#index'

  resources :books

  get 'login', to: 'login#index'
  get 'register', to: 'register#index'
end
