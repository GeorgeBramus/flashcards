Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  resources :cards
  resources :decks

  root 'home#index'
  post '/', to: 'home#check'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
