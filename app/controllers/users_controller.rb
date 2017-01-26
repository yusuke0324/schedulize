class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    # @user = User.find_by(id: params[:id])
    p '*' * 10
    @user = User.find(params[:id])
    p @user
  end
  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to user_path(@user)
    else
      render action: "new"
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def


  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
