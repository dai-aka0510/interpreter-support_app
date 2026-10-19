class DashboardsController < ApplicationController
  before_action :require_login

  def show
    @projects_count = current_user.projects.count
  end
end
