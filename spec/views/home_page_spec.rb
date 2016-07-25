require 'rails_helper'

RSpec.feature 'Home page', :type => :feature do
  scenario 'brand name' do
    visit root_path
    expect(page).to have_content 'xTicket'
  end

  scenario 'search header text' do
    visit root_path
    expect(page).to have_content 'Discover upcoming events'
  end

end
