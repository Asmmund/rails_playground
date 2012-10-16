class UserSignupController < ApplicationController
  include Wicked::Wizard
  steps  :address, :company_info, :sum_up

  def show
    @user = session[:user]
#    case step
#    when :sum_up
#      if @user.save
#        # success
#      else
#        # didn't work
#      end
#    end
    render_wizard 
  end
  
  def update
    @user = session[:user] 
    @user.update_attributes(params[:user])
    render_wizard @user
  end
end
