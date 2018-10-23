Rails.application.routes.draw do

  get 'sessions/new'

  get 'session/new'

  root 'home#index'

  get '/about', to: 'home#about'

  get '/contact', to: 'home#contact'

  get '/signup', to: 'users#new'

  post '/signup', to: 'users#create'

  get '/signin', to: 'sessions#new'

  post '/signin', to: 'sessions#create'

  delete '/signout', to: 'sessions#destroy'

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
