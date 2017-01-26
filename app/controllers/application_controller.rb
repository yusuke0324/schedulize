class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  private
  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_session_url
    end
  end

   def correct_user(user)
     unless user == current_user
        flash[:alert] = "You are unauthorized to view this page"
        redirect_to new_session_url
     end
   end

end
