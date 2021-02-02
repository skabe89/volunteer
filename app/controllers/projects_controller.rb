class ProjectsController < ApplicationController

  before_action :find_project, only: [:show, :edit, :update, :destroy]

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.organizer_id = helpers.current_user.id
    if @project.save
      redirect_to project_path(@project)
    else
      flash.now[:error] = @project.errors.full_messages
      render :new
    end
  end

  def show
    @pledges = Pledge.where(project_id: params[:id])
  end

  def edit
  end

  def update
    @project.update(project_params)
    if @project.save
      redirect_to project_path(@project)
    else
      flash.now[:error] = @project.errors.full_messages
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to new_project_path
  end

  private

  def project_params
    params.require(:project).permit(:community_id, :title, :date, :address, :description, :estimated_hours, :min_volunteers)
  end

  def find_project
    @project = Project.find_by(id: params[:id])
  end

end