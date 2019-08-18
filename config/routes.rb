Rails.application.routes.draw do
  # get 'books/index'
  # get 'books/show'
  resources :books

  resources :categories, only: [] do
    resources :books, only: :index
  end

  get 'home/index'

  root 'home#index'
end
