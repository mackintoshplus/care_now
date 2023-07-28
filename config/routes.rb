Rails.application.routes.draw do
  devise_for :users
  # Reservations routes
  resources :reservations, only: [:index, :new, :create, :destroy]

  # Root path route
  root "reservations#index"
end
