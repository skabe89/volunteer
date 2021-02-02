class ProjectsController < ApplicationController

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
    @project = Project.find_by(id: params[:id])
  end

  private

  def project_params
    params.require(:project).permit(:community_id, :title, :date, :address, :description, :estimated_hours, :min_volunteers)
  end

end