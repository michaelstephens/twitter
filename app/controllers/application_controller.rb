class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authentication_check
    unless current_user
      redirect_to root_path
    end
  end
end
