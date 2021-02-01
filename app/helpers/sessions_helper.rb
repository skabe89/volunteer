module SessionsHelper

  def is_logged_in?
    !!session[:user_id]
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def google
    @user = User.find_or_create_by(name: auth['email']) do |user|
      user.password = SecureRandom.hex(10)
    end
    if @user && @user.id
      session[:user_id] = @user.id
      redirect_to users_path
    else
      redirect_to root_path
    end
  end

  private

  def auth
    request.env['omniauth.auth']['info']
  end

end
