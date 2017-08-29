class TasksController < ApplicationController

  before_action :set_project
  before_action :set_task, except: [:create]

  def create
    @project = Project.find(params[:project_id])
    @task = @project.task.create
  end

  def new
    @task = Task.new(params)
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_task
    @todo_task = Task.find(params[:task_id])
  end

  def task_params
    params[:task].permit(:title, :done, :deadline)
  end

end
