class UsersController < ApplicationController
  skip_filter :ensure_logged_in


  def new
    @new_user = User.new
    #necessary redirect?
    redirect_to root_path, notice: "Click a button at the top of the page to sign up or login"
  end

  def create
    @new_user = User.new(user_params)
    if @new_user.save
      session[:user_id] = @new_user.id
      redirect_to root_path, notice: "You signed up!"
    else
      redirect_to root_path, notice: "You failed"
    end
  end

  private

  def user_params
    params.require(:user).permit!
  end

end
