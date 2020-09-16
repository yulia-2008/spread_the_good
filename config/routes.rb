Rails.application.routes.draw do
    namespace :api do
      namespace :v1 do
        resources :users
        resources :comments
        resources :posts
        resources :connections

        post '/login', to: 'auth#create'
        get '/profile', to: 'users#profile'
      end
    end
  end

  # nuzhen li /login rout? eto zhe component budet?
