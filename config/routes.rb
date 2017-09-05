Rails.application.routes.draw do
  resources :cards

  root 'home#index'
  post '/', to: 'home#check'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
