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

  get '/private_circuits', to: 'private_circuits#index'
  get '/private_circuits/new', to: 'private_circuits#new'
  post '/private_circuits', to: 'private_circuits#create'
  get '/private_circuits/:id', to: 'private_circuits#show'
  get '/private_circuits/:id/edit', to: 'private_circuits#edit'
  patch '/private_circuits/:id', to: 'private_circuits#update'
  put '/private_circuits/:id', to: 'private_circuits#update'
  delete '/private_circuits/:id', to: 'private_circuits#destroy'

  get '/published_circuits', to: 'published_circuits#index'
  get '/published_circuits/:id', to: 'published_circuits#show'
  post '/published_circuits/:id', to: 'published_circuits#add'
end
