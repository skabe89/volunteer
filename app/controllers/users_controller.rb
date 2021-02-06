class UsersController < ApplicationController

  before_action :redirect_if_not_logged_in, only: [:show, :edit, :update]

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user
      redirect_to edit_user_path(@user)
    else
      full_error_messages(@user)
      render :new
    end
  end

  def show
    @user = current_user
    @lead_projects = Project.user_organized_projects(@user.id)
    # @lead_projects = Project.where(organizer_id: @user.id)
    @projects = @lead_projects + @user.projects
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.state_id = user_params[:state_id]
    @user.update(user_params)
    if @user.save
      redirect_to root_path
    else
      full_error_messages(@user)
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :state_id, community_attributes: [:location])
  end

end
