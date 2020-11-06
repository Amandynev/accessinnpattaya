Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  root to: 'pages#home'
  get 'contact', to: 'pages#contact'
  get 'restaurant', to: 'pages#restaurant'
  get 'event', to: 'pages#event'
  resources :contacts, only: [:index,:new, :create]
  get 'allmybookings', to: 'bookings#allmybookings', as: 'allmybookings'
  get 'searchedrooms', to: 'rooms#searchedrooms'
  resources :rooms, only: [:index, :show] do
    resources :bookings, only: [:index, :create]
  end
  delete 'destroy_bookings/:category_id', to: 'bookings#destroy_bookings', as: "destroy_bookings"
  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end

  mount StripeEvent::Engine, at: '/stripe-webhooks'

  require "sidekiq/web"

  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
