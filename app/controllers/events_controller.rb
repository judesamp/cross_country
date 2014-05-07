class EventsController < ApplicationController
  def index
    @events = Event.all.shuffle
  end

  def new
    @new_event = Event.new
  end

  def create
    @new_event = Event.new(event_params)
    if @new_event.save
      redirect_to event_path(@new_event)
    else
      redirect_to new_event_path(@new_event), notice: "Something is amiss. Please try again."
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
    params.require(:event).permit(:name, :description, :event_date, :event_image)
  end


end

