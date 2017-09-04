Rails.application.routes.draw do
  resources :cards
  get '/reiteration', to: 'cards#reiteration'

  post '/home/check'
  get '/home', to: 'home#index'
  get 'home/index'
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
