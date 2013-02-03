class UsersController < ApplicationController
  def index
   # debugger
   @users = User.order(' id DESC')
   @time = Time.zone.now.beginning_of_day..Time.zone.now.end_of_day
   logger.debug "Date span is '#{@time.inspect}"
  end
  def show
    @user = User.find(params[:id])
  end

  def new
    session[:user_params] ||= {}
    @user = User.new(session[:user_params])
    @user.current_step = session[:user_step]
  end

  def user_valid_actions
    if params[:back_button]
      @user.previous_step
    elsif @user.last_step?
      @user.save if @user.all_valid?
    else
      @user.next_step
    end
    session[:user_step] = @user.current_step
  end

  def after_save
      session[:user_step] = session[:user_params] = nil
      flash[:notice] = "User saved!"
      redirect_to users_path
  end

  def create
    session[:user_params].deep_merge!(params[:user]) if params[:user]
    @user = User.new(session[:user_params])
    @user.current_step = session[:user_step]
    if @user.valid?
      user_valid_actions
    end
    if @user.new_record?
      render "new"
    else
      after_save
    end
  end
end
