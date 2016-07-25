require 'rails_helper'

RSpec.describe EventsController, type: :routing do
  describe 'EventsController routing' do
    it 'routes to #index' do
      expect(:get => '/events').to route_to('events#index')
    end

    it 'routes to #create' do
      expect(:post => '/events').to route_to('events#create')
    end
  end
end