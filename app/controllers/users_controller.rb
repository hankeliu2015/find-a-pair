class UsersController < ApplicationController
  def new
    # render plain: "hello"
    # @user = User.new
  end

  def create
    # byebug
    # raise "hello".inspect
    @user = User.create(email: params[:email])
    @user.save
    redirect_to "/login"
  end

end #end of class
