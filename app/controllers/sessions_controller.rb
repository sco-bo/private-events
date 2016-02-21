class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user
      log_in user
      remember user
      redirect_to root_path
    else 
      flash.now[:danger] = 'Invalid email/password combo'
      render 'new'
    end
  end

  def delete
    log_out if logged_in?
    redirect_to login_path
  end
end
