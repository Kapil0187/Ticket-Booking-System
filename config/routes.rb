Rails.application.routes.draw do
  get 'flights/index'
  get 'trains/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'home#main_page'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check
  get 'bus', to: 'home#index'
  get 'show', to: 'home#show'

  get 'train', to: 'trains#index'
  get 'show_train', to: 'trains#show_train'

  get 'flight', to: 'flights#index'
  get 'show_flight', to: 'flights#show_flight'

  get 'allbookings', to: 'allbookings#show'
  get 'history', to: 'allbookings#history'

  # get 'bookings/show_ticket', to:"bookings#show_ticket"
  resources :bookings

  get 'payments/success'
  get 'payments/cancel'
  resources :payments

  # Defines the root path route ("/")-
  # root "posts#index"
end
