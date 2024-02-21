Rails.application.routes.draw do
  devise_for :users, skip: [:registrations]
  resources :actualities, only: %i[index show]
  resources :events, only: %i[index show new create], path: 'agenda'
  resources :associations, only: %i[index show]
  resources :cities, only: %i[index], path: 'ma-ville-pratique'
  get 'a-propos', to: 'generals#about'
  get 'mentions-legales', to: 'generals#legal_notice'
  root to: "pages#homemaintenance"
   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
