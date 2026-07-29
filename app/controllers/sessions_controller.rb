class SessionsController < ApplicationController
  # ログイン画面を表示
  def new
  end

  # ログイン処理(ログインセッションを新しく作る)
  def create
    user = User.authenticate_by(email: params[:email], password: params[:password])

    if user
      # 新しいセッションを開始(セキュリティのため)
      reset_session
      # ログインしたユーザーのIDをセッションに保存
      session[:user_id] = user.id
      # リンク元のページに戻る
      redirect_to root_path
    else
      # エラーメッセージの設定
      @error = "メールアドレスまたはパスワードが違います"
      # ログイン画面の再表示
      render :new, status: :unprocessable_entity
    end
  end

  # ログイン情報を削除してログアウト
  def destroy
    reset_session
    redirect_to login_path
  end

  # ゲストログイン機能
  def guest
    user = User.find_by(email: "guest@example.com")

    # 新しいセッションを開始(セキュリティのため)
    reset_session
    # ログインしたユーザーのIDをセッションに保存
    session[:user_id] = user.id
    # リンク元のページに戻る
    redirect_to root_path
  end
end
