Rails.application.routes.draw do

  resources :restrictions, only: [:edit, :update]
  resources :recipes, only: [:index, :show]
  resources :users
  resources :sessions, except: [:index]
  resources :kitchens, only: [:edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'users#show'
  get '/home', to: 'sessions#index', as: 'home'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
