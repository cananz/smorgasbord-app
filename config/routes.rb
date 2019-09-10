Rails.application.routes.draw do
  resources :recipes
  resources :users
  resources :user_ingredients, only: [:new, :create, :edit, :update, :destroy]
  resources :sessions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

end
