class WelcomeController < ApplicationController
  skip_filter :ensure_logged_in
  skip_filter :ensure_ownership


  def index
    @new_user = User.new
    @images = Image.all.shuffle
  end

  private

end
    
