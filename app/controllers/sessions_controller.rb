class SessionsController < ApplicationController
  def new
    @session = session 
  end

  def create
    @session[:user_id] = User.find_by(email: params[:user][:email])
  end
end
