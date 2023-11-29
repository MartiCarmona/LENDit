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

  get '/favorites/index', to: 'favorites#index'

  # bookings
  resources :bookings, only: [] do
    member do
      patch :accept
      patch :reject
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



  get '/help', to: 'helps#index'
end
