Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :teachers, only: [:index, :edit, :update, :show, :new, :create, :destroy] do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:destroy, :show, :edit, :update] do
    member do
      get :confirm
    end
  end
  get 'profil', to: 'pages#profil'
end
