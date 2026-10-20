class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create], raise: false

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user) # 登録後そのまま自動ログイン（Sorcery）
      redirect_to dashboard_path, notice: "会員登録が完了しました！"
    else
      flash.now[:danger] = "会員登録に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end