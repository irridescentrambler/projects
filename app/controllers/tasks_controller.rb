class TasksController < ApplicationController

  before_action :set_task, only: [ :show, :edit, :update, :destroy ]

  def index
    @tasks = Task.all
  end

  def new
    @tasks = Task.new
  end

  def show
    authorize! :show, @task
  end

  def create
    @task = Task.new(task_params.merge(creator_id: current_user.try(:id)))
    if @task.save
      redirect_to request.referrer || task_path(@task), alert: "Successfully created the task"
    else
      redirect_to request.referrer || new_task_path, alert: @task.errors.full_messages
    end
  end

  def edit
  end

  def update
    authorize! :update, @task
    if @task.update(task_params)
      redirect_to request.referer || task_path(@task), alert: "Successfully updated the task"
    else
      redirect_to request.referer || edit_task_path(@task), alert: @task.errors.full_messages
    end
  end

  def destroy
    @task.destroy
    redirect_to request.referer || edit_task_path(@task), alert: "Successfully deleted"
  end

  private 
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name, :status, :description, :developer_id, :project_id, :creator_id)
    end
end
