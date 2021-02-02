require 'rails_helper'

RSpec.feature 'Logins', type: :feature do
  before :each do
    @user = User.create(name: 'John')
    visit '/login'
  end

  it 'user can login and it is redirected' do
    fill_in 'Name',	with: 'John'
    click_button 'Log In'
    expect(current_path).to eq(user_path(@user))
    expect(page).to have_text('Logged in')
  end

  it 'wrong user can not login' do
    fill_in 'Name',	with: 'Peter'
    click_button 'Log In'
    expect(page).to have_no_text('Logged in')
  end
end
