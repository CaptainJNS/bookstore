Rails.application.routes.draw do
  devise_for :users
  get 'persons/profile'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'home#home'

  get 'persons/profile', as: 'user_root'

  resources :books
end
