class EventsController < ApplicationController
  def index
    @events = current_user.events.shuffle
    respond_to do | format |  
        format.js {}  
    end
  end

  def new
    @new_event = Event.new
  end

  def create
    @new_event = Event.new(event_params)
    if @new_event.save
      redirect_to events_path
    else
      render new_event_path, notice: "Something is amiss. Please try again."
    end
  end

  def show
    @event = Event.find(params[:id])
    @commentable = @event
    @comments = @commentable.comments
    @comment = Comment.new
    @new_comment = @event.comments.build
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to event_path
    else
      redirect_to edit_event_path(@event), notice: "Something went Kablooey. Aw man."
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.destroy
      redirect_to events_path
    else
      redirect_to edit_event_path(@event), notice: "This event is hard to kill. Please try again."
    end
  end

  def download
   @event = Event.find(params[:id])
    file = @event.event_image
    send_file file.path
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :event_date, :event_image, :user_id)
  end


end

