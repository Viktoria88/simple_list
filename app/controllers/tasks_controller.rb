class TasksController < ApplicationController

  def create
    @project = Project.find(params[:project_id])
    @task = @project.task.create
  end

  def new
    @task = Task.new(params)
  end


end
