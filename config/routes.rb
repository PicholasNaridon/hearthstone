Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :cards, only: [:index, :show]
    end
  end

  post '/decks/:id/:card' => 'decks#add_card'

  devise_for :users

  resources :decks

  resources :cards

  get 'home/index'
  root 'home#index'
end
