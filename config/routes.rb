Rails.application.routes.draw do
  root "home#index"

  resources :users, only: [ :new, :create ]
  resources :projects do
    resources :receipts, only: [ :new, :create, :edit, :update, :destroy ]
  end

  # 静的ページ
  get "terms", to: "pages#terms", as: :terms
  get "privacy", to: "pages#privacy", as: :privacy
  get "contact", to: "pages#contact", as: :contact

  # 新規会員登録
  get "signup", to: "users#new", as: :signup
  resources :users, only: [ :create ]

  resource :dashboard, only: [ :show ]
  resources :projects, only: [ :index, :new, :create, :show, :edit, :update, :destroy ]

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
