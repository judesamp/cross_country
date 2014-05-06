class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def new
    @new_image = Image.new
    @new_image.tags.build
  end

  def create
    @new_image = Image.new(image_params)
    if @new_image.save
      redirect_to image_path(@new_image)
    else
      redirect_to new_image_path(@new_image), notice: "Something is amiss. Please try again."
    end
  end

  def show
    @image = Image.find(params[:id])
    @commentable = @image
    @comments = @commentable.comments
    @comment = Comment.new

    @tags = @image.tags
    @tag = Tag.new
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    if @image.update(image_params)
      redirect_to image_path
    else
      redirect_to edit_image_path(@image), notice: "Something went Kablooey. Aw man."
    end
  end

  def destroy
    @image = Image.find(params[:id])
    if @image.destroy
      redirect_to images_path
    else
      redirect_to edit_image_path(@image), notice: "This image is hard to kill. Please try again."
    end
  end

  def download
   @image = Image.find(params[:id])
    file = @image.image_data
    send_file file.path
  end

  private

  def image_params
    params.require(:image).permit(:title, :description, :image_date, :image_data, tags_attributes: [:id, :name, :_destroy])
  end


end
