class UserSignupController < ApplicationController

  def step2
    update
    render 'user_signup/index'
  end
  def step3
    update
    render 'user_signup/company_info'   
  end
  def step4
    update
    if @user.save
      render 'user_signup/sum_up'      
    else
      redirect_to step2
    end
  end
    def update
    @user = session[:user] 
    @user.update_attributes(params[:user])
  end
end
