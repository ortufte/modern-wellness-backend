Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do 
      post '/login', to: 'sessions#create'
      post '/signup', to: 'users#create'
      get '/get_current_user', to: 'users#show'
      delete '/logout', to: 'sessions#destroy'

      resources :users do 
        resources :logs, only: [:create, :index]
        resources :medicines
      end
    end
  end
end

