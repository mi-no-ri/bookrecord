class UsersController < ApplicationController
  # ユーザー新規登録画面
  def new
    @user = User.new
  end

  # ユーザーを登録
  def create
    @user = User.new(user_params)

    if @user.save
      # 登録成功時はログイン画面へ移行
      redirect_to login_path, notice: "ユーザーを登録しました"
    else
      # 失敗時は登録画面を再表示
      render :new, status: :unprocessable_entity
    end
  end

  private

  # フォームから送信されたuserデータのうち、保存を許可する項目
  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation
    )
  end
end
