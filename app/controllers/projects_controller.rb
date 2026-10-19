class ProjectsController < ApplicationController
  before_action :require_login

  def index
    @projects = current_user.projects
  end

  def new
    @project = current_user.projects.build
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      redirect_to projects_path, notice: "案件を登録しました！"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :client_name, :event_date, :amount)
  end
end