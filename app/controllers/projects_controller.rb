class ProjectsController < ApplicationController
  #before_action :authenticate_user!
  before_action :set_project, only: [:edit, :update, :destroy]
  before_action :all_projects, only: [:index, :create, :update, :destroy]
  respond_to :html, :js

  # GET /projects
  # GET /projects.json

  # GET /projects/1
  # GET /projects/1.json
  def index
    @projects = Project.all
    @tasks = Task.all
  end
  # GET /projects/new
  def new
    @project = Project.new
    @project.tasks.build
  end

  # GET /projects/1/edit


  # POST /projects
  # POST /projects.json
  def create
    @project = Project.create(project_params)
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    @project.update_attributes(project_params)

  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy

  end


  private

    # def current_user
    #   @user = current_user
    # end

    def all_projects
      @projects = Project.all
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title)
    end
end
