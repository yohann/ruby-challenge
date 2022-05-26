class TasksController < ApplicationController
  before_action :find_action
  def index
    @tasks = Task.where(filter_params).page(params[:page] || 1).per(params[:per_page] || 10)
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
  
  def filter_params
    defaults = { archived: false }
    params.permit(:title, :archived, :status).reverse_merge(defaults)
  end

  def find_action
    begin
      @task = Task.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      head :not_found
    end 
  end
end
