Rails.application.routes.draw do
  root to: 'products#index'

  devise_for :users

  resources :products do
    resources :bookings, only: [:new, :create, :show]
    resources :favorites, only: [:create]
    resources :reviews, only: [:new, :create, :destroy, :index]

    resources :chats, only: [:new, :create]

    member do
      get 'toggle_favorite'
    end
  end

  resources :bookings do
    resources :reviews, only: [:new, :create, :destroy, :index]

    member do
      patch :accept
      patch :decline
      delete :cancel
    end

    collection do
      get :lends
      get :borrows
    end
  end

  resources :chats, only: [:show] do
    resources :messages, only: [:create]
  end

  resources :users, only: [:show] do
    resources :reviews, only: [:new, :create, :destroy, :index]

  end

  namespace :status do
    resources :lends, only: [] do
      collection do
        get :ongoing
        get :finished
      end
    end

    resources :borrows, only: [] do
      collection do
        get :ongoing
        get :finished
      end
    end
  end

  get "/profile/:id", to: "profiles#show", as: "profile"
  get "/profile/:id/favorites", to: "favorites#index", as: "profile_favorites"
  get "/profile/:id/lends", to: "bookings#index", as: "profile_bookings"
  get "/profile/:id/reviews", to: "reviews#index", as: "index_reviews"

  get '/help', to: 'helps#index'
end
