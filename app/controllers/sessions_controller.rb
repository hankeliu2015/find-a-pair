class SessionsController < ApplicationController
  def new
    @session = User.new
  end

  def create
    # byebug
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      # raise "Hello".inspect
      # session[:current_user_id] = @user.id  #replace it with private method login(user)
      login(@user)
      redirect_to '/'
    else
      # flash[:notice] = "Warning: No user found"
      # redirect_to "/login", alert: "Alert: Please check user name or password"
      redirect_to "/login", notice: "Notice: check user name or password"
    end
  end

  def destroy
    reset_session
    redirect_to '/'
  end

end
