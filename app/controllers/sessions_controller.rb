class SessionsController < ApplicationController
  def new
    # @session = session
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user
      # raise "Hello".inspect
      # session[:current_user_id] = @user.id  #replace it with private method login(user)
      login(@user)
      redirect_to '/'
    else
      # flash[:notice] = "Warning: No user found"
      redirect_to "/login", alert: "Warning: No user found"
    end
  end

  def destroy
    reset_session
    redirect_to '/'
  end

end
