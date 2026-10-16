Rails.application.routes.draw do
  get "projects/index"
  get "projects/new"
  get "projects/create"
  # トップページ（まずはここをトップ画面にします）
  root "home#index"

  # Projectの基本機能（CRUD）
  resources :projects

  # ヘルスチェック（Railsデフォルト）
  get "up" => "rails/health#show", as: :rails_health_check
end
