Rails.application.routes.draw do
  get 'home/home'
  get 'home/about'
  devise_for :users
  root to: 'home#home'

  resources :users
  resources :books
end
