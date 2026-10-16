Rails.application.routes.draw do
<<<<<<< HEAD
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
  get "home/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
  resources :projects, only: [:index, :new, :create]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

=======
  get "projects/index"
  get "projects/new"
  get "projects/create"
  # トップページ（まずはここをトップ画面にします）
>>>>>>> origin/main
  root "home#index"

  # Projectの基本機能（CRUD）
  resources :projects

  # ヘルスチェック（Railsデフォルト）
  get "up" => "rails/health#show", as: :rails_health_check
end
