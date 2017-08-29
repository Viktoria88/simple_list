class ProjectsController < ApplicationController
  before_action :authenticate_user!, exept: [:index, :show]
  before_action :set_project, only: [:edit, :update, :destroy]
  before_action :all_projects, only: [:index, :create, :update, :destroy]
  respond_to :html, :js

  # GET /projects
  # GET /projects.json

  # GET /projects/1
  # GET /projects/1.json


  # GET /projects/new
  def new
    @project = Project.new
    # @project.projects.build
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

  # def update_row_order
  #   @project = Project.find(project_params[:project_id])
  #   @project.row_order_position = project_params[:row_order_position]
  #   @project.save
  #
  #   render nothing: true # this is a POST action, updates sent via AJAX, no view rendered
  # end


  private

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
