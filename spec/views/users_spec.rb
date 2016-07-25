require 'rails_helper'

RSpec.feature 'Users', :type => :feature do
  scenario 'users can register' do
    visit new_user_path
    fill_in 'user[name]', with: 'Nghi'
    fill_in 'user[email]', with: 'nghi@mail.com'
    fill_in 'user[password]', with: '123'
    find('.btn.btn-primary-outline').click
    expect(page).to have_content "Welcome Nghi, you've joined the greatest network!"
  end

  scenario 'register form validation' do
    visit new_user_path
    find('.btn.btn-primary-outline').click
    expect(page).to have_content "Password can't be blank"
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Email can't be blank"
  end
end
