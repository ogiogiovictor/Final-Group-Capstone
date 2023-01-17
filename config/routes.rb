# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do
      get 'cars', to: 'cars#all_cars'
      get 'users/login', to: 'users#login'
      resources :users, except: [:new] do
<<<<<<< HEAD
        resources :cars
        resources :reservations
=======
        # devise_for :users, path: '', path_names: {
        #   sign_in: 'login',
        #   sign_out: 'logout',
        #   registration: 'signup'
        # },
        # controllers: {
        #   sessions: 'users/sessions',
        #   registrations: 'users/registrations'
        # }
        resources :motorcycles
        resources :bookings
>>>>>>> a910480 (Dev fix)
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
