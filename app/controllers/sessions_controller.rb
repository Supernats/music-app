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
    else
      flash[:errors] = "Invalid login information"
      render :new
    end
  end

  def destroy
    @user = current_user
    if logged_in?(@user)
      flash[:notices] = "Successfully logged out."
      logout_user!(@user)
    end
    nil
  end

end