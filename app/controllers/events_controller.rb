class EventsController < ApplicationController
  before_action :select_list_data, only: [:new, :create, :edit, :update]

  def new
    @event = Event.new
  end

  def index
    if params[:search]
      @events = Event.search(params[:search]).order_by_created_day
    else
      @events = Event.all.sort.keep_if { |event| event.starts_at.future? && event.published_at.present? }
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
      flash.now[:error] = @event.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def publish
    @event = Event.find(params[:event_id])
    if @event.ticket_types.size > 0
      if @event.update(published_at: DateTime.now)
        flash[:success] = "#{@event.name} is published"
      else
        flash[:error] = @event.errors.full_messages.to_sentence
      end
    else
      flash[:error] = 'Event should have at least 1 ticket type before publishing'
    end
    redirect_to event_path(@event.id)
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      flash[:success] = "#{@event.name} was updated"
    else
      flash.now[:error] = @event.errors.full_messages.to_sentence
    end

    redirect_to event_path(@event.id)
  end

  private

  def event_params
    params.require(:event).permit(:starts_at, :ends_at, :name, :hero_image_url, :extended_html_description, :venue_id, :category_id).merge({ user_id: current_user.id })
  end

  def select_list_data
    @venues     = Venue.all.collect { |venue| [venue[:name], venue[:id]] }
    @categories = Category.all.collect { |category| [category[:name], category[:id]] }
  end
end
