module SessionsHelper

  def current_user
    @user = User.find_by_session_token(session[:session_token])
  end

  def logged_in?(user)
    user.session_token == session[:session_token]
  end

  def login_user!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
    redirect_to user_url(user)
  end

  def logout_user!(user)
    user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_session_url
  end


end