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
      flash.now[:error] = @user.errors.full_messages
      render :new
    end
  end

  def edit
    @user = User.find_by(id: helpers.current_user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :community_id)
  end
  
end
