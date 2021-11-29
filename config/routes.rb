Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'home#index'

  get '/about', to: 'home#about'

  resources :posts

  resources :circuits

  get '/exhibition', to: 'circuits#public'
  post '/circuits/:id/publish', to: 'circuits#publish'
  post '/circuits/:id/unpublish', to: 'circuits#unpublish'
end
