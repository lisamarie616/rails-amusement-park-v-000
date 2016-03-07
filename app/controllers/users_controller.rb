class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_or_create_by(user_params)
    if @user.save
      log_in(@user)
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin)
    end
end
