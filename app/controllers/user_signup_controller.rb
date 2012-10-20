class UserSignupController < ApplicationController

  def steps
    @redir = true
    path = request.env['PATH_INFO'][1..-1]
    next_step path
    if path == 'step4' && @redir
      @user = User.create(session[:user])
    end
    render "user_signup/#{path}" if @redir
  end
  
  def next_step path
    valid_or_back path
    update
  end  
  def valid_or_back path
#    case path
#    when 'step2'
#        @redir =  false unless params[:user] && params[:user][:email].present?  
#    when 'step3'
#        @redir = false unless params[:user] && params[:user][:address].present?
#    when 'step4'
#        @redir = false unless params[:user] && params[:user][:company_info].present?
#    end
#      redirect_to :back, notice: 'Fill in the fields!'  unless @redir
#
  end

  def update
    session[:user] = if session[:user].present?
      session[:user].merge(params[:user]) { |key, old, new| new } 
    else
      params[:user]
    end
  end
end
