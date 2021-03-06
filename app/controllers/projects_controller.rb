class ProjectsController < ApplicationController
  
  before_action :redirect_if_not_logged_in
  before_action :find_project, only: [:show, :edit, :update, :destroy]
  before_action :redirect_if_not_organizer, only: [:edit, :update, :destroy]
  before_action :redirect_if_location_is_empty, only: [:new, :index]
  before_action :redirect_if_not_in_users_community, only: [:show]
  
  def index
    @projects = Project.in_date_user_projects(current_user.community.id, Date.today).order("date ASC")
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.organizer_id = current_user.id
    if @project.save
      redirect_to project_path(@project)
    else
      helpers.full_error_messages(@project)
      render :new
    end
  end

  def show
    @pledges = Pledge.project_pledges(@project.id).reverse[0,3]
    # @pledges = Pledge.where(project_id: @project.id).reverse[0,3]
  end

  def edit
  end

  def update
    @project.update(project_params)
    if @project.save
      redirect_to project_path(@project)
    else
      helpers.full_error_messages(@project)
      render :edit
    end
  end

  def destroy
    @project.pledges.destroy_all
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

  def redirect_if_location_is_empty
    if current_user.community.nil?
      flash[:error] = ["Update your location to proceed!"]
      redirect_to edit_user_path(current_user)
    end
  end

  def redirect_if_not_organizer
    if @project.organizer != current_user
      redirect_to user_path(current_user)
    end
  end

  def redirect_if_not_in_users_community
      if @project.community != current_user.community
        redirect_to projects_path
      end
  end

end