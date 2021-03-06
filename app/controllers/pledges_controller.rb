class PledgesController < ApplicationController
  
  before_action :redirect_if_not_logged_in
  before_action :find_project, only: [:index, :new]

  def index
    @pledges = @project.pledges.reverse
  end

  def new
    @pledge = Pledge.new
  end

  def create
    @pledge = current_user.pledges.build(pledge_params)
    if @pledge.save
      redirect_to project_path(find_project)
    else
      flash[:error] = @pledge.errors.full_messages
      redirect_to new_project_pledge_path(find_project)
    end
  end

  def destroy
    @pledge = Pledge.find_by(id: params[:id])
    @pledge.destroy
    redirect_to user_path(current_user)
  end

  private

  def pledge_params
    params.require(:pledge).permit(:project_id, :hours, :comment)
  end

  def find_project
    @project = Project.find_by(id: params[:project_id])
  end

end



