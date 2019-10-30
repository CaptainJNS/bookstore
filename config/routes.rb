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

  resources :users, only: [] do
    resources :orders, only: %i[index show] do
      resources :order_items, only: :index
    end
  end

  resources :orders do
    resources :order_items
  end

  resources :orders
end
