class TasksController < ApplicationController
  before_action :find_action
  def index
    @tasks = Task.page(params[:page]).per(params[:per_page])
    render json: @tasks, status: :ok
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      render json: @task, status: :created
    else
      render json: @task.errors, status: :bad_request
    end
  end

  def update
    if @task.update task_params
      render json: @task, status: :ok
    else
      render json: @task.errors, status: :bad_request
    end
  end

  def destroy
    if @task.destroy
      head :no_content
    else
      head status: :bad_request
    end
  end
  
  private

  def task_params
    params.require(:task).permit(:title, :archived, :status)
  end

  def find_action
    @task = Task.find_by(id: params[:id])
  end
end
