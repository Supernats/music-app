class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.create(params[:user])
    if !!@user
      login_user!(@user)
      flash[:notices] = "Thanks for signing up!"
    else
      flash[:errors] = "Oh, no! Those credentials won't work. Please try again."
      render :new
    end
  end

end