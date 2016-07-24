class EventsController < ApplicationController
  def new
    @event      = Event.new
    @venues     = Venue.all.collect { |venue| [venue[:name], venue[:id]] }
    @categories = Category.all.collect { |category| [category[:name], category[:id]] }
  end

  def index
    if params[:search]
      @events = Event.search(params[:search]).order_by_created_day
    else
      # @events = Event.all.sort.keep_if { |event| event.starts_at.future? }
      @events = Event.all.order_by_created_day
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def my_events
    @events = Event.by_user_id(current_user.id).order_by_created_day
    render 'index'
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = "Event #{@event.name} is created. Publish to make it visible"
      redirect_to event_path(@event.id)
    else
      flash.now[:error] = "Error #{@event.errors.full_messages.to_sentence}"
      render 'new'
    end
  end

  private

  def event_params
    params.require(:event).permit(:starts_at, :ends_at, :name, :hero_image_url, :extended_html_description, :venue_id, :category_id).merge({ user_id: current_user.id })
  end
end
