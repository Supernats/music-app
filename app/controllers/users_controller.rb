class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.create(params[:user])
    if !!@user
      flash[:notices] = "Thanks for signing up!"
      login_user!(@user)
      redirect_to user_url(user)
    else
      flash[:errors] = "Oh, no! Those credentials won't work. Please try again."
      render :new
    end
  end

  def show
    @user = current_user
    render :show
  end
end