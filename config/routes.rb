Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :cards
    end
  end

  resources :decks do
    resources :comments
  end

  resources :comments

  post '/decks/:id/:card' => 'decks#add_card'
  get '/decks/:id/:card' => 'decks#delete_card'


  devise_for :users

  resources :decks do
    resources :hands do
      resources :cards
    end
  end

  resources :cards

  get 'home/index'
  root 'home#index'
end
