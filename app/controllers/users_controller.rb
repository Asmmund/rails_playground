class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    session[:user] = User.new(params[:user])
    redirect_to user_signup_index_path
  end
end
