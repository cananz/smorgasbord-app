Rails.application.routes.draw do
  resources :recipes

  resources :sessions, except: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/users/:id/edit-restricted', to: 'users#edit_restricted', as: 'edit_restricted'

  patch '/users/:id/edit-restricted', to: 'users#update_restricted'

  get '/users/:id/edit-kitchen', to: 'users#edit_kitchen', as: 'edit_kitchen'
  patch '/users/:id/edit-kitchen', to: 'users#update_kitchen'



  root 'users#show'
  get '/home', to: 'sessions#index', as: 'home'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


  resources :users #, except: [:update, :edit]
end
