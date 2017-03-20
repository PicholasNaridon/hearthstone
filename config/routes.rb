Rails.application.routes.draw do
  devise_for :users

  resources :decks

  get 'home/index'
  root 'home#index'
end
