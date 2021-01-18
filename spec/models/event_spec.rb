require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:user) { User.create(name: 'John') }
  let(:event) { Event.create(description: 'house party', location: 'House', event_date: Time.now, creator: user) }
  let(:event1) { Event.create(description: '') }
  context 'checks validity of an event and makes sure its created by a user' do
    it 'makes sure description is not empty' do
      expect(event.valid?).to be true
    end
    it 'makes sure location is not empty' do
      event.location = ''
      expect(event).not_to be_valid
    end
    it 'makes sure event date and time is not empty' do
      event.event_date = ''
      expect(event).not_to be_valid
    end
    it 'makes sure description is not empty' do
      event.description = ''
      expect(event).not_to be_valid
    end
    it 'makes sure the event has a user' do
      expect(event1).not_to be_valid
    end
  end
end
