require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:user) { FactoryGirl.create :user }

  describe 'GET #create' do
    it 'login success with correct email and password' do
      get :create, password: user.password, email: user.email
      expect(response).to redirect_to root_path
    end
  end

  describe 'GET #destroy' do
    it 'logout success' do
      get :destroy
      expect(flash[:success]).to eq 'Logged out.'
    end
  end

end
