require 'rails_helper'

RSpec.describe EventsController, type: :routing do
  describe 'EventsController routing' do
    it 'routes to #index' do
      expect(:get => '/events').to route_to('events#index')
    end

    it 'routes to #create' do
      expect(:post => '/events').to route_to('events#create')
    end

    it 'should recognize a specific events#show route' do
      assert_routing("/events/1", {:controller => "events", :action => "show", :id => '1'})
    end

    it 'should recognize a specific events#show route' do
      assert_routing("/events/1/edit", {:controller => "events", :action => "edit", :id => '1'})
    end
  end
end