class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home
  end

  private

  def current_user
      User.find_by(id: session[:user_id])
  end

  def logged_in?
      !!current_user
  end

end
