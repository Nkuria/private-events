require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:user) { create(:user)}
  let(:event) {user.events.build(description: 'event created by user')}
  let(:event1) {build(:event)}
  context "checks validity of an event and makes sure its created by a user" do
    it 'makes sure description is not empty' do
      event.description = ''
      expect(event.valid?).to be false
    end
    it 'makes sure description is not empty' do
      event.description = 'First event'
      expect(event.valid?).to be true
    end
    it 'makes sure the event has a user' do
      expect(event1.valid?).to be false
    end
  end
end
