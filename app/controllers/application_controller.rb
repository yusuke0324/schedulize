class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login


  private

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_user_url
    end
  end

  def correct_user?(user)
    user == current_user
  end

  def is_mentor?
    curent_user.mentor
  end
end
