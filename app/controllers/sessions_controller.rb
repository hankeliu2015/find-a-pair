class SessionsController < ApplicationController
  def new
    # @session = session
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user
      raise "Hello".inspect
      @session[:user_id] = @user.id
      #the action works, but need to redirect to a valid page
    else
      # flash[:notice] = "Warning: No user found"
      redirect_to "/login", notice: "Warning: No user found"
    end
  end
end
