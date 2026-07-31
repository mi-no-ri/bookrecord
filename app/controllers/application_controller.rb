class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  private

  # 現在ログインしているユーザーを取得するメソッド
  def current_user
    # @current_userが未取得の場合
    unless @current_user
      # sessionに保存されているuser_idを使ってユーザーを取得する
      @current_user = User.find_by(id: session[:user_id])
    end

    # 取得したログインユーザーを返す
    @current_user
  end

  # ログインが必要なページへのアクセス制限を行うメソッド
  def require_login
    # ユーザーがログインしていない場合
    unless current_user
      # ログインページへ移行
      redirect_to login_path
    end
  end
end
