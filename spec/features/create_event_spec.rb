require 'rails_helper'

RSpec.feature 'CreateEvents', type: :feature do
  before :each do
    @user = User.create(name: 'John')
    @user2 = User.create(name: 'Peter')
    visit '/login'
    fill_in 'Name',	with: 'John'
    click_button 'Log In'
    @event = Event.create(creator: @user)
  end

  it 'User can create an event' do
    expect(@event.valid?).to be true
  end

  it 'It is possible to add attendees to events' do
    visit event_path(@event)
    fill_in 'event_id',	with: @event.id
    select @user2.name, from: 'user_id'
    click_button 'Invite friend'

    expect(page).to have_text('Invitation sent')
  end

  it 'Can not add two time the same attendee' do
    visit event_path(@event)
    fill_in 'event_id',	with: @event.id
    select @user2.name, from: 'user_id'
    click_button 'Invite friend'
    select @user2.name, from: 'user_id'
    click_button 'Invite friend'

    expect(page).to have_no_text('Invitation sent')
  end
end
