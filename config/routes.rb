Rails.application.routes.draw do
  get "inventories/index"
  # get "orders/new"
  get "homes/index"
  devise_for :users
  resources :orders
  resources :inventories
  namespace :vendor do
    resources :orders, only: [:index]
    resources :inventory, only: [:index] do
      member do
        get 'edit'
        patch 'update'
      end
    end
  end

  namespace :customer do
    resources :orders, only: [:new, :create, :show]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "homes#index"
end
