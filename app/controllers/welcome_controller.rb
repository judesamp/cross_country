class WelcomeController < ApplicationController
  def index
    @images = Image.all.shuffle

  end
end
