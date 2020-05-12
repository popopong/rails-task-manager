class TasksController < ApplicationController
  before_action :select_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(restaurant_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
  end

  def update
    @task.update(restaurant_params)
    redirect_to tasks_path
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def restaurant_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def select_task
    @task = Task.find(params[:id])
  end
end
