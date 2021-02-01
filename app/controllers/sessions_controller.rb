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



  def logout
    session.clear
    redirect_to users_path
  end

end
