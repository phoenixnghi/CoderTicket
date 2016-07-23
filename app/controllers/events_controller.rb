class EventsController < ApplicationController
  def index
    if params[:search]
      @events = Event.search(params[:search]).order('created_at DESC')
    else
      # @events = Event.all.sort.keep_if { |event| event.starts_at.future? }
      @events = Event.all
    end
  end

  def show
    @event = Event.find(params[:id])
  end
end
