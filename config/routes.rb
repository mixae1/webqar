Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'home#index'

  get '/auth', to: 'auth#index'
  post '/auth', to: 'auth#create'
  delete '/auth/:id', to: 'auth#destroy'

  get '/users/new', to: 'users#new'
  post '/users', to: 'users#create'
  # put '/users/:id', to: 'users#update'

  get '/posts', to: 'posts#index'
  get '/posts/new', to: 'posts#new'
  post '/posts', to: 'posts#create'
  get '/posts/:id', to: 'posts#show'
  get '/posts/:id/edit', to: 'posts#edit'
  patch '/posts/:id', to: 'posts#update'
  put '/posts/:id', to: 'posts#update'
  delete '/posts/:id', to: 'posts#destroy'

  get '/circuits', to: 'circuits#index'
  get '/circuits/new', to: 'circuits#new'
  post '/circuits', to: 'circuits#create'
  get '/circuits/:id', to: 'circuits#show'
  get '/circuits/:id/edit', to: 'circuits#edit'
  patch '/circuits/:id', to: 'circuits#update'
  put '/circuits/:id', to: 'circuits#update'
  delete '/circuits/:id', to: 'circuits#destroy'
end
