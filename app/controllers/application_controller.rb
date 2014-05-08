class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :ensure_logged_in
  # before_filter :ensure_ownership
  helper_method :current_user

  private

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  # def ensure_ownership
  #   resource, id = request.path.split('/')[1,2]
  #   unless current_user.id == id
  #     redirect_to root_path, notice: "You don't have permission to view this page!"
  #   end
  # end

  def ensure_logged_in
    if current_user.nil?
      redirect_to root_path, notice: "You are not logged in, jack"
    end
  end

end
