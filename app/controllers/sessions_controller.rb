class SessionsController < ApplicationController
  def new
    @users = User.all
  end

  def create
    @user = User.find(params[:user][:id])
    if @user
      log_in(@user)
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end
end
