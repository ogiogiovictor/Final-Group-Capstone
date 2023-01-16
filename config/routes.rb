Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get 'motorcycles', to: 'motorcycles#all_motorcycles'
      resources :users, except: [:new] do
        resources :motorcycles
        resources :bookings
      end
    end
  end

  # resources :users
  # resources :bookings
  # resources :motorcycles


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
