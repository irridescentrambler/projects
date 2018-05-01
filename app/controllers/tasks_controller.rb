class TasksController < ApplicationController

  before_action :set_task, only: [ :show, :edit, :update, :destroy ]

  def index
    @tasks = Task.all
  end

  def new
    @tasks = Task.new
  end

  def show
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to request.referrer, alert: "Successfully created the task"
    else
      redirect_to request.referrer, errors: @task.errors.full_messages
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to request.referer, alert: "Successfully updated the task"
    else
      redirect_to request.referer, errors: @task.errors.full_messages
    end
  end

  def destroy
    @task.destroy
  end

  private 
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name, :status, :description, :developer_id, :project_id).merge(creator_id: current_user.try(:id))
    end
end
