class ProjectsController < ApplicationController

  # ログインしているユーザーだけがアクセスできるようにする（Sorceryの機能など）
  before_action :require_login

  def index
    @projects = current_user.projects.order(event_date: :desc)
  end

  def new
    @project = current_user.projects.new
  end

  def create
    @project = current_user.projects.new(project_params)
    if @project.save
      redirect_to projects_path, notice: "案件を登録しました！"
    else
      flash.now[:alert] = "登録に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :client_name, :amount, :event_date)
  end
end