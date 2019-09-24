Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :books

  get 'login', to: 'login#index'
  get 'register', to: 'register#index'
end
