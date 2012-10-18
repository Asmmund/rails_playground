class UsersController < ApplicationController
  def new
    
  end
  
  def create
    session[:user] = params[:user]
    redirect_to step2_path
  end
end
