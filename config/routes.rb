Rails.application.routes.draw do
  devise_for :users
  resources :reservations, only: [:index, :new, :create, :destroy]
  
  namespace :admin do
    get 'dashboard/index'
    resources :dashboard, only: [:index]
  end
  
  root "reservations#index"
end
