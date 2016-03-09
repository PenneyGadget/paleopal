Rails.application.routes.draw do
  root 'home#index'
  get '/dashboard', to: 'users#show'
  get '/resources', to: 'resources#show'
  post '/entry/calculate', to: 'entries#get_api_nutrients'

  get 'auth/facebook/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :entries
end
