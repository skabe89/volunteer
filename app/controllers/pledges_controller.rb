class PledgesController < ApplicationController

  def index
    if params[:project_id]
      @project = Project.find_by(id: params[:project_id])
      @pledges = @project.pledges.reverse
    else
      redirect_to root_path
    end
  end

  def new
    @project = Project.find_by(id: params[:project_id])
    @pledge = Pledge.new
  end

  def create
    @pledge = helpers.current_user.pledges.build(pledge_params)
    if @pledge.save
      redirect_to project_path(Project.find_by(id: params[:project_id]))
    else
      flash[:error] = @pledge.errors.full_messages
      redirect_to new_project_pledge_path(Project.find_by(id: params[:project_id]))
    end
  end

  private

  def pledge_params
    params.require(:pledge).permit(:project_id, :hours, :comment)
  end

end



