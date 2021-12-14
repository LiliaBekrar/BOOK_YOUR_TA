Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :teachers, only: [:index, :show, :new, :create, :destroy] do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:destroy, :show]
  resources :users, only: [:show]
  get 'profil', to: 'pages#profil'
end
