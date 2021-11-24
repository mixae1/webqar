Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'home#index'

  get '/about', to: 'home#about'

  resources :auth, only: %i[index create destroy]

  get '/users/new', to: 'users#new'
  post '/users', to: 'users#create'

  resources :posts

  # get '/circuits', to: 'circuits#index'
  # get '/circuits/new', to: 'circuits#new'
  # post '/circuits', to: 'circuits#create'
  # get '/circuits/:id', to: 'circuits#show'
  # get '/circuits/:id/edit', to: 'circuits#edit'
  # patch '/circuits/:id', to: 'circuits#update'
  # put '/circuits/:id', to: 'circuits#update'
  # delete '/circuits/:id', to: 'circuits#destroy'

  resources :private_circuits

  resources :published_circuits, only: %i[index show create destroy]
end
