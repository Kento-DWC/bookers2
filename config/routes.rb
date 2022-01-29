Rails.application.routes.draw do
  get 'home/home'
  get 'home/about'
  devise_for :users
  root to: 'home#home'

  resources :users
  resources :books do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

end
