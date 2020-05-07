class UsersController < ApplicationController
  def new
    # render plain: "hello"
    @user = User.new
    if session[:current_user_id]
      redirect_to '/', notice: "User already login"
    end
  end

  def create
    # byebug
    # raise "hello".inspect
    # @user = User.create(email: params[:email]) #form_tag params format is different with form_for
    @user = User.create(email: params[:user][:email], password: params[:user][:password])
    if @user.save
      redirect_to "/login"
    else
      render :new
    end
  end

end #end of class
