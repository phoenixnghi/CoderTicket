class VenuesController < ApplicationController
  def index
    @venues = Venue.all
  end

  def new
    @venue  = Venue.new
    @region = Region.all.collect { |region| [region[:name], region[:id]] }
  end

  def create
    @venue = Venue.new(venue_params)

    if @venue.save
      flash[:success] = "Venue #{@venue.name} is created."
      redirect_to venues_path
    else
      flash.now[:error] = @venue.errors.full_messages.to_sentence
      render 'new'
    end
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :full_address, :region_id)
  end
end
