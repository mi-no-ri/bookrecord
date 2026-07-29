Rails.application.routes.draw do
  # 一覧画面をトップページとして表示
  root "books#index"
  # BooksControllerのCRUDルーティング
  resources :books

  # ユーザー新規登録
  resources :users, only: [ :new, :create ]

  # ログイン画面を表示
  get "/login", to: "sessions#new"
  # ログインフォームを送信するとログイン処理が実行される
  post "/login", to: "sessions#create"
  # ログアウト処理
  delete "/logout", to: "sessions#destroy"

  # ゲストログイン
  get "/guest_login", to: "sessions#guest"
end
