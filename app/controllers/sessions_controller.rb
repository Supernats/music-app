class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )
    if !!@user
      flash[:notices] = "Welcome back!"
      login_user!(@user)
      redirect_to user_url(user)
    else
      flash[:errors] = "Invalid login information"
      render :new
    end
  end

  def destroy
    @user = current_user
    flash[:notices] = "Successfully logged out."
    logout_user!(@user)
    redirect_to new_session_url
  end

end