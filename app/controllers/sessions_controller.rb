class SessionsController < ApplicationController

  def login
  end

  def log
    if params[:email]
      @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect_to users_path
        else
          flash.now[:error] = ["Something went wrong, please try again!"]
          render :login
        end
    end
  end

  def google
    @user = User.find_or_create_by(email: auth['email']) do |user|
      user.name = auth['name']
      user.password = SecureRandom.hex(10)
      byebug
    end
    if @user && @user.id
      session[:user_id] = @user.id
      redirect_to users_path
    else
      flash.now[:error] = @user.errors.full_messages
      redirect_to users_path
    end
  end

  def logout
    session.clear
    redirect_to users_path
  end



  private

  def auth
    request.env['omniauth.auth']['info']
  end

end
