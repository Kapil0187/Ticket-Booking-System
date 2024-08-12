Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "home#rootpage" 
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check
  get "bus_search" ,to:"home#index"
  get "search" ,to:"home#search"
  # get 'bookings/show_ticket', to:"bookings#show_ticket"
  resources :bookings 
  resources :tickets
  
  # Defines the root path route ("/")
  # root "posts#index"
end
