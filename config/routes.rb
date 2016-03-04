Rails.application.routes.draw do
  root "home#index"
  get 'auth/facebook/callback', to: 'sessions#create'
  get '/dashboard', to: 'users#show'
  delete '/logout', to: 'sessions#destroy'

  resources :entries, only: [:new, :create, :show]
end
