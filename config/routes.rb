Rails.application.routes.draw do
  resources :mypets
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "auth/keycloack/callback"=>"sessions#create"
  get "login"=>"sessions#route_to_kc"
  post "login"=>"sessions#route_to_kc"
  # Defines the root path route ("/")
  root "mypets#index"


  get '/auth/failure', to: 'sessions#failure'
  get 'sign_out', to: 'sessions#destroy', as: :sign_out_path

end
