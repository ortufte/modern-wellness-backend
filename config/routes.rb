Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do 
      post '/login', to: 'sessions#create'
      post '/signup', to: 'users#create'
      get '/get_current_user', to: 'sessions#get_current_user'
      delete '/logout', to: 'sessions#destroy'

      resources :users do 
        resources :logs, only: [:create, :index, :show, :update, :destroy]
        resources :medicines, only: [:create, :index, :show, :update, :destroy]
      end
    end
  end
end

