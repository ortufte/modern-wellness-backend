Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do 
      post '/login', to: 'sessions#create'
      delete '/logout', to: 'sessions#delete'
      resources :users do 
        resources :logs
        resources :medicines
      end
    end
  end
end

