Rails.application.routes.draw do
  # 一覧画面をトップページとして表示
  root "books#index"
  # BooksControllerのCRUDルーティング
  resources :books
end
