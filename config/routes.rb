Rails.application.routes.draw do
  # Reservations routes
  resources :reservations, only: [:index, :new, :create, :destroy]

  # Root path route
  root "reservations#index"
end
