class UserSignupController < ApplicationController

  def steps
    @check = true
    next_step
    path = request.env['PATH_INFO']
    @user = session[:user]     if path == '/step4'
     render "user_signup/#{path[1..-1]}" if @check
  end
  
  def next_step
    valid_or_back
    update
  end  
  def valid_or_back
    if params[:user].present?
      params[:user].map do |k,v| 
        if v == '' && @check
          redirect_to :back, notice: 'Fill in the fields!' 
          @check = false
        end
      end
    else
      redirect_to :back, notice: 'Fill in the fields!' 
      @check = false 
    end
 
  end
  def update
    session[:user].update_attributes(params[:user])
  end
end
