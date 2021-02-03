module ApplicationHelper
  
  def redirect_if_not_logged_in
    if session[:user_id].nil?
      flash[:error] = ["Please login to continue"]
      redirect_to login_path
    end
  end

end
