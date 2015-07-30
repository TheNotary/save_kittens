class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def admins_only!
    if current_user.nil? or !current_user.admin?
      redirect_to root_path, :alert => "This page is secured.  Please login."
    end

  end
end
