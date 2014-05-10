class CommentsController < ApplicationController
  before_filter :load_commentable
  #skip_before_filter :load_commentable, :only => [:custom_create]
  #skip_filter :ensure_ownership

  def index
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    if @comment.save
      redirect_to @commentable, notice: "Comment created"
    else
      render :new
    end
  end

  # did this to test method taught in class for embedding forms/etc from other classes
  # but I removed the form:)
  # def custom_create
  #    @new_comment = Comment.new(comment_params)
  #   if @new_comment.save
  #     redirect_to events_path notice: "Comment created"
  #   else
  #     render :new
  #   end
  # end

  private 

  def load_commentable
    resource, id = request.path.split('/')[1,2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end

  def comment_params
    params.require(:comment).permit(:content, :commentable_id, :commentable_type)
  end


end