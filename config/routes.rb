Rails.application.routes.draw do
  devise_for :users

  scope '(:locale)', locale: /th|fr/ do
    get 'home/index'
    root to: 'pages#home'
    resources :pages, only: [:index,:new, :create]
    get 'contact', to: 'pages#contact', as: 'contact'
    get 'restaurant', to: 'pages#restaurant'
    get 'event', to: 'pages#event'
    get 'allmybookings', to: 'bookings#allmybookings', as: 'allmybookings'
    get 'allmyreservations', to: 'orders#allmyreservations', as: 'allmyreservations'
    get 'searchedrooms', to: 'rooms#searchedrooms'
    resources :rooms, only: [:index, :show] do
      resources :bookings, only: [:index, :create]
    end
    delete 'destroy_bookings/:category_id', to: 'bookings#destroy_bookings', as: "destroy_bookings"
    resources :orders, only: [:index, :show, :create] do
      resources :payments, only: :new
    end

    post :create_order, to: 'orders#create_order'
    post :capture_order, to: 'orders#capture_order'

    namespace :paypal do
      resources :checkouts, only: [:create]
    end

    mount StripeEvent::Engine, at: '/stripe-webhooks'

    require "sidekiq/web"

    authenticate :user, ->(user) { user.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
