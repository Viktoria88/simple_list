class TasksController < ApplicationController

  # before_action :set_project, except: [:edit]
  before_action :set_task, except: [:create, :new, :show]

  def new
    @task = Task.new
  end

  def create

    @task = Task.create(task_params)
    respond_to do |f|
      f.html { redirect_to projects_url }
      f.js
    end
  end

  def show

  end

  def edit
    set_project
  end

  def update
    set_project
    @task.update(task_params)
    @task.update_attributes(task_params)

    respond_to do |f|
      f.html { redirect_to projects_url }
      f.js
    end
  end

  def destroy
    if @task.destroy
      flash[:success] = "Task was deleted."
      respond_to do |f|
        f.html { redirect_to projects_url }
        f.js
      end
    else
      flash[:error] = "Task could not be deleted."
    end
  end



  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params[:task].permit(:title, :done, :deadline, :project_id)
  end

end
