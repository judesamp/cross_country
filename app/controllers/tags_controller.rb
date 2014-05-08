class TagsController < ApplicationController
  before_filter :load_image
  skip_filter :ensure_ownership

  def index
    @image = @current_image
    @tags = @image.tags
  end

  def new
    @image = @current_image
    @tag = @image.tags.new
  end

  def create
    @image = @current_image
    tag = Tag.where(name: tags_params[:name]).first_or_create
    if @image.tags << tag
      redirect_to @current_image, notice: "Comment created"
    else
      render :new
    end
  end





  private 

  def load_image
    resource, id = request.path.split('/')[1,2]
    @current_image = resource.singularize.classify.constantize.find(id)
  end

  def tags_params
    params.require(:tag).permit(:name)
  end

end