class UsersController < ApplicationController
  def new
    # render plain: "hello"
    @user = User.new
  end

  def create
    @user = User.new(email: params[:user][:email])
  end

end #end of class
