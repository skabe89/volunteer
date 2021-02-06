class SessionsController < ApplicationController

  before_action :redirect_if_not_logged_in, only: [:logout]

  def login
  end

  def log
    if params[:email]
      @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
          log_in_user
          redirect_to root_path
        else @user 
          flash.now[:error] = ["Invalid email or password"]
          render :login
        end
    end
  end

  def google
    @user = User.find_or_create_by(email: auth['email']) do |user|
      user.name = auth['name']
      user.password = SecureRandom.hex(10)
    end
    if @user && @user.id
      log_in_user
      if @user.community.nil?
        redirect_to edit_user_path(@user)
      else
        redirect_to root_path
      end
    else
      full_error_messages(@user)
      redirect_to users_path
    end
  end

  def logout
    session.clear
    redirect_to root_path
  end



  private

  def auth
    request.env['omniauth.auth']['info']
  end

end
