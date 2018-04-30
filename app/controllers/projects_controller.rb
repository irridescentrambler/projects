class ProjectsController < ApplicationController
  before_action :set_project, only: [ :show, :edit, :update, :destroy ]

  def index
    if current_user.admin?
      @projects = current_user.managed_projects
    else
      @projects = current_user.projects
    end
  end

  def new
    authorize! :create, current_user
    @project = Project.new
  end

  def create
    authorize! :create, current_user
    @project = Project.new(project_params)
    if @project.save
      redirect_to project_path(@project), alert: "Successfully created the project"
    else
      render :new, alert: @project.errors.full_messages
    end
  end

  def show
    authorize! :read, current_user
    @task = @project.tasks.build
  end

  def edit
    authorize! :update, current_user
  end

  def update
    authorize! :update, current_user
    if @project.update(project_params)
      redirect_to project_path(@project), alert: "Successfully updated"
    else
      redirect_to project_path(@project), alert: @project.errors.full_messages
    end
  end

  def destroy
    authorize! :delete, current_user
    @project.destroy
    redirect_to projects_path, alert: "Successfully deleted"
  end

  private
    def project_params
      params.require(:project).permit(:name, :description, :developer_ids => []).merge(manager_id: current_user.try(:id))
    end

    def set_project
      @project = Project.find(params[:id])
    end
end
