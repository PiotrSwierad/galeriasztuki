Rails.application.routes.draw do

  resources :arts



  get 'sessions/new'

  get 'session/new'

  get '/signin', to: 'sessions#new'

  post '/signin', to: 'sessions#create'

  delete '/signout', to: 'sessions#destroy'


  get '/signup', to: 'users#new'

  post '/signup', to: 'users#create'

  resources :users


  get '/about', to: 'home#about'

  get '/contact', to: 'home#contact'

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
