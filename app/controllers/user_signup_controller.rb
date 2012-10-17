class UserSignupController < ApplicationController

  def steps
    update
    path = request.env['PATH_INFO']
    render "user_signup/#{path[1..-1]}" 
  end

    def update
    @user = session[:user] 
    @user.update_attributes(params[:user])
  end
end
