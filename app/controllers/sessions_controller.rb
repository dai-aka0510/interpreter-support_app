class SessionsController < ApplicationController
  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_to dashboard_path, notice: "ログインしました！"
    else
      # 失敗時は render ではなく root_path へリダイレクトしてすっきりさせる
      redirect_to root_path, alert: "ログインに失敗しました。メールアドレスとパスワードをご確認ください。"
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: "ログアウトしました！"
  end
end
