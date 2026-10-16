class SessionsController < ApplicationController
  def new
    # ログイン画面を表示するだけ
  end

  def create
    user = login(params[:email], params[:password])
    if user
      redirect_to projects_path, notice: 'ログインしました！'
    else
      flash.now[:alert] = 'ログインに失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'ログアウトしました！'
  end
end