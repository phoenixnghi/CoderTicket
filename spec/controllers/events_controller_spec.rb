require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'GET #new' do
      get :new
      expect(response).to render_template(:new)
    end
  end
end
