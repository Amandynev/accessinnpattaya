Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :rooms, only: [:index, :show] do
    resources :bookings, only: [:index, :create]
  end
  get 'contact', to: 'pages#home'
  get 'restaurant', to: 'pages#home'
  get 'event', to: 'pages#home'
  resources :rooms, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
