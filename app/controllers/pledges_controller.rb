class PledgesController < ApplicationController

  def new
    @project = Project.find_by(id: params[:project_id])
    @pledge = Pledge.new
  end

  def create
    @pledge = helpers.current_user.pledges.build(project_id: params[:project_id], hours: params[:pledge_hours])
    if @pledge.save
      redirect_to project_path(Project.find_by(id: params[:project_id]))
    else
      flash[:error] = @pledge.errors.full_messages
      redirect_to new_project_pledge_path(Project.find_by(id: params[:project_id]))
    end
  end

end



