class UsersController < ApplicationController
  skip_filter :ensure_logged_in
  skip_filter :ensure_ownership


  def new
    @new_user = User.new
    redirect_to root_path, notice: "Click a button at the top of the page to sign up or login"
  end

  def create
    @new_user = User.new(user_params)
    if @new_user.save
      session[:user_id] = @new_user.id
      redirect_to root_path, notice: "You signed up!"
    else
      render :new, notice: "You failed"
    end
  end

  private

  def user_params
    params.require(:user).permit!
  end

end
