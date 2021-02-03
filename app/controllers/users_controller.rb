class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to edit_user_path(@user)
    else
      # flash.now[:error] = @user.errors.full_messages
      helpers.full_error_messages(@user)
      render :new
    end
  end

  def show
    @user = User.find_by(id: helpers.current_user.id)
    @lead_projects = Project.where(organizer_id: @user.id)
  end

  def edit
    @user = helpers.current_user
  end

  def update
    @user = helpers.current_user
    @user.state_id = user_params[:state_id]
    @user.update(user_params)
    if @user.save
      redirect_to root_path
    else
      # flash.now[:error] = @user.errors.full_messages
      helpers.full_error_messages(@user)
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :state_id, community_attributes: [:location])
  end


end
