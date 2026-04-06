Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :destinations, only: [:index, :show]

  resources :trips, only: [:index, :show, :new, :create] do
    member do
      patch :select_flight
      patch :confirm
      get :export
    end
    resources :flights, only: [:index]
    resources :transports, only: [:index]
    resources :categories, only: [:index] do
      resources :places, only: [:index]
    end
    resources :bookmarks, only: [:create, :destroy]
  end

  resources :places, only: [:show]
  resources :bookmarks, only: [:destroy]

  get "up" => "rails/health#show", as: :rails_health_check
end
