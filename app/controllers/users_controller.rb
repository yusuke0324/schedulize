class UsersController < ApplicationController

  def new
    if current_user
      redirect_to user_path(current_user)
    else
      @user = User.new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def show
    if current_user == nil
      redirect_to new_user_url
    else
      @user = User.find_by(id: params[:id])
      correct_user(@user)
    end
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
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :phase, :mentor)
  end
end
