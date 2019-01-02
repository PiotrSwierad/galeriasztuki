Rails.application.routes.draw do

  resources :arts do
    collection do
      post :sort
    end
  end

  post '/arts/:id', to: 'arts#make_featured' 

  get 'home/createPlaceholder', to: 'home#createPlaceholder'
  

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

  get '/admin', to: 'home#admin'

  post '/admin', to: 'home#admin_update'

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
