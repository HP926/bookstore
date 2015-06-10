class SessionsController < ApplicationController
  
  def new
  
  end

  def create
   @user = User.where(username: params[:username]).first
    if @user.present? && @user.authenticate(params[:password])
      session[:user_id] = @user.id 
      flash[:notice] = "Welcome to site, #{@user.username}"
      redirect_to root_path
    else
      flash[:alert] = 'Opps! Wrong'
     render :new
   end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
