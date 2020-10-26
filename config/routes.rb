Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'contact', to: 'pages#contact'
  get 'restaurant', to: 'pages#restaurant'
  get 'event', to: 'pages#event'
  resources :rooms, only: [:index, :show] do
    resources :bookings, only: [:index, :create]
  end
  resources :orders, only: [:show, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
