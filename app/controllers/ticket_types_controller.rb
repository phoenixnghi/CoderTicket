class TicketTypesController < ApplicationController
  before_action :set_ticket_type, only: [:show, :edit, :update, :destroy]
  before_action :set_event, only: [:new, :create, :show, :edit, :update, :destroy]

  def index
    @ticket_types = TicketType.all
  end

  def new
    @ticket_type = TicketType.new
  end

  def create
    @ticket_type       = TicketType.new(ticket_type_params)
    @ticket_type.event = @event

    if @ticket_type.save
      flash[:success] = "TicketType #{@ticket_type.name} is created."
      redirect_to event_path(@ticket_type.event_id)
    else
      flash.now[:error] = "Error #{@ticket_type.errors.full_messages.to_sentence}"
      render 'new'
    end
  end

  private

  def ticket_type_params
    params.require(:ticket_type).permit(:name, :price, :max_quantity)
  end

  def set_ticket_type
    @ticket_type = TicketType.find(params[:id])
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
