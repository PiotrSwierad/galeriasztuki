Rails.application.routes.draw do

  get 'session/new'

  root 'home#index'

  get '/about', to: 'home#about'

  get '/contact', to: 'home#contact'

  get '/signup', to: 'users#new'

  post '/signup', to: 'users#create'

  get '/login', to: 'session#new'

  post '/login', to: 'session#create'

  delete '/login', to: 'session#destroy'

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
