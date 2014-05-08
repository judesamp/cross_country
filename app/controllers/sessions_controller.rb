class SessionsController < ApplicationController
  skip_filter :ensure_logged_in
  skip_filter :ensure_ownership

  def new

  end

  def create
    user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
    if user
      session[:user_id] = user.id
      redirect_to images_path, success: "logged in"
    else
      flash.now.alert = "invalid email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, success: "You logged out!"
  end

end

