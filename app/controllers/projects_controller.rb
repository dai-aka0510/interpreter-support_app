class ProjectsController < ApplicationController
  before_action :require_login
  before_action :set_project, only: [ :show, :edit, :update, :destroy ]

  def index
    @projects = current_user.projects
  end

  def show
    # @project は before_action の set_project で自動取得されます
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

  def edit
    # @project は before_action の set_project で自動取得されます
  end

  def update
    if @project.update(project_params)
      redirect_to project_path(@project), notice: "案件を更新しました！"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path, notice: "案件を削除しました！"
  end

  private

  def set_project
    @project = current_user.projects.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :client_name, :event_date, :amount)
  end
end
