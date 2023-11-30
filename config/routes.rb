Rails.application.routes.draw do
  root to: 'products#index'

  devise_for :users

  # products
  resources :products do
    resources :bookings, only: [:new, :create, :show]
    resources :favorites, only: [:create]
    resources :reviews, only: [:new, :create]
    resources :chats, only: [:new, :create]

    member do
      get 'toggle_favorite'
    end
  end




  # bookings
  resources :bookings, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    member do
      patch :accept
      patch :decline
    end
    collection do
      get :pending_lend
      get :accepted_lend
      get :declined_lent
    end
  end

  # chats
  resources :chats, only: [:show] do
    resources :messages, only: [:create]
  end

  # users
  resources :users, only: [:show] do
    resources :reviews, only: [:index]
  end

  # status lends
  resources :lends, only: [] do
    collection do
      get :ongoing
      get :finished
    end
  end

  # status borrows
  resources :borrows, only: [] do
    collection do
      get :ongoing
      get :finished
    end
  end

  get "/profile/:id", to: "profiles#show", as: "profile"
  get "/profile/:id/favorites", to: "favorites#index", as: "profile_favorites"
  get "/profile/:id/lends", to: "bookings#index", as: "profile_bookings"

  get '/help', to: 'helps#index'
end
