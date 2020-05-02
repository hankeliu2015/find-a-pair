class ApplicationController < ActionController::Base
  before_action :current_user
  def home
  end

  private
  def current_user
    if session[:current_user_id]
      @current_user ||= User.find(session[:current_user_id])
    end
  end

  def login(user)
    session[:current_user_id] = user.id
  end

  def logged_in?
    current_user ? true : false
  end

  def authenticaton_required
    if !logged_in?
      redirect_to "/login"
    end
  end
end
