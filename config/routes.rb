Rails.application.routes.draw do
  root 'home#index'
  get '/resources', to: 'resources#show'
  post '/entry/calculate', to: 'entries#get_api_nutrients'

  get 'auth/facebook/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users do
    get '/dashboard', to: 'entries#index'
    resources :entries, except: [:index]
  end
end
