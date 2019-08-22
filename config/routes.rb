Rails.application.routes.draw do
  # get 'books/index'
  # get 'books/show'
  resources :books

  get 'home/index'

  root 'home#index'
end
