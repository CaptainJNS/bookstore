Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'home#index'

  resources :books
  resources :users, only: %i[update edit destroy]

  resources :books, only: :show do
    resources :reviews, only: :create
  end

  resources :orders do
    resources :order_items
  end

  devise_scope :user do
    get  'users/fast_new',    to: 'users#fast_new'
    post 'users/fast_create', to: 'users#fast_create'
  end

  resources :checkouts, only: %i[show update]
end
