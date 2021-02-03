module SessionsHelper

  def log_in_user
    session[:user_id] = @user.id
  end

  def is_logged_in?
    !!session[:user_id]
  end

  def current_user
    User.find_by(id: session[:user_id]) if session[:user_id]
  end


end
