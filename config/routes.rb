Rails.application.routes.draw do
  root 'home#index'
  get '/dashboard', to: 'users#show'
  get '/resources', to: 'resources#show'

  get 'auth/facebook/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :entries, only: [:new, :create, :show]
end
