class ProjectsController < ApplicationController

  before_action :set_project, only: [ :show, :edit, :update, :destroy ]

  def index
    @projects = Project.where(manager_id: current_user.try(:id))
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
    else
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def project_params
      params.require(project).permit(:name, :description).merge(manager_id: current_user.try(:id))
    end

    def set_project
      @project = Project.find(params[:id])
    end
end
