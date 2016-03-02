Rails.application.routes.draw do
  root "home#index"

  get 'auth/facebook/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/dashboard', to: 'users#show'

  resources :entries, only: [:new, :create, :show]
end
