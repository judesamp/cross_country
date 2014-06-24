class WelcomeController < ApplicationController
  skip_filter :ensure_logged_in

  def index
    @new_user = User.new
    @images = Image.all.shuffle
    @recent_images = Image.recent_images
  end
 
end
    
