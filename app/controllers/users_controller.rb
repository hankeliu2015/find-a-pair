class UsersController < ApplicationController
  def new
    # render plain: "hello"
    @user = User.new
  end

  def create
    # byebug
    # raise "hello".inspect
    # @user = User.create(email: params[:email]) #form_tag params format is different with form_for
    @user = User.create(email: params[:user][:email])
    @user.save
    redirect_to "/login"
  end

end #end of class
